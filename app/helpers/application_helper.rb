module ApplicationHelper
  
  def getGCSUrl(key)
    return "https://storage.googleapis.com/rails_link_in_bio_images/#{key}"
  end
end
