class LandingpagesController < ApplicationController
  before_action :set_landingpage, only: %i[ show edit update destroy ]
  before_action :authenticate_account!
  before_action :redirect_to_friendly_url, only: [:edit]

  # GET /landingpages or /landingpages.json
  def index
    @landingpages = Landingpage.all
  end

  # GET /landingpages/1 or /landingpages/1.json
  def show
    redirect_to edit_landingpage_path(Landingpage.where(account_id: current_account.id).first.id)
  end
  
  # GET /landingpages/new
  def new
    #@landingpage = Landingpage.new
    redirect_to edit_landingpage_path(Landingpage.where(account_id: current_account.id).first.id)
  end
  
  # GET /landingpages/1/edit
  def edit
    @blocks = Block.where(landingpage_id: @landingpage.id)
    @new_block = Block.new
    
    puts "---------"
    puts "---------"
    # Print the avatar attached to the user
    puts Account.where(id: @landingpage.account_id).first.avatar.key
    puts "---------"
    puts "---------"
  end

  # PATCH/PUT /landingpages/1 or /landingpages/1.json
  def update
    respond_to do |format|
      if @landingpage.update(landingpage_params)
        format.html { redirect_to landingpage_url(@landingpage), notice: "Landingpage was successfully updated." }
        format.json { render :show, status: :ok, location: @landingpage }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @landingpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landingpages/1 or /landingpages/1.json
  def destroy
    @landingpage.destroy

    respond_to do |format|
      format.html { redirect_to landingpages_url, notice: "Landingpage was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landingpage
      if params[:id] != nil
        @landingpage = Landingpage.find(params[:id])
      else
        @landingpage = Landingpage.where(url: params[:landingpage_url]).first
      end
      #@landingpage = Landingpage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landingpage_params
      params.require(:landingpage).permit(:url, :main_bg_colour, :profile_bg_colour)
    end
    
    def redirect_to_friendly_url
      if request.path.include?("landingpages") and request.path.include?("edit")
        if params[:id] != nil
          @landingpage = Landingpage.find(params[:id])
        else
          @landingpage = Landingpage.where(url: params[:landingpage_url]).first
        end
        redirect_to friendly_edit_landingpage_path(@landingpage.url)
      end
    end
end
