class HomeController < ApplicationController
  def home
    # Keep the marketing/home page available for signed-in users too.
    # The editor is still reachable via the landing page edit route.
  end
  
  def landingpage    
    @landingpage = Landingpage.where(url: params[:landingpage_url]).first
    
    if @landingpage
      @blocks = Block.where(landingpage_id: @landingpage.id).order(position: :asc)
      @new_block = Block.new
      @socials = {facebook: Account.find(@landingpage.account_id).facebook, twitter: Account.find(@landingpage.account_id).twitter, linkedin: Account.find(@landingpage.account_id).linkedin, github: Account.find(@landingpage.account_id).github}.as_json
    else
      similar_landingpages = Landingpage.where("url LIKE ?", "%#{params[:landingpage_url]}%").first
      if similar_landingpages
        redirect_to root_path, notice: "We couldn't find <strong>/#{params[:landingpage_url]}</strong> :( Did you mean to go to <a href='/#{similar_landingpages.url}'><strong>/#{similar_landingpages.url}</strong></a>?"
      else
        redirect_to root_path, notice: "We couldn't find any matches for <strong>/#{params[:landingpage_url]}</strong> :("
      end
    end
  end
  
  def error_routing
    redirect_to root_path
  end
end
