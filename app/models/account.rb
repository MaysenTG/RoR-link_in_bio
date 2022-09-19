class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  validates_uniqueness_of :landingpage_url
  
  # Validates a landingpage URL with no spaces
  validates :landingpage_url, format: { with: /\A[a-zA-Z0-9]+\z/,
    message: "only allows letters and numbers (no spaces)" }
  
  after_save :create_landingpage

  def create_landingpage
    Landingpage.create(url: landingpage_url, account_id: id)
    #redirect_to edit_landingpage_path(Landingpage.where(account_id: id).first.id)
  end
  
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
end
