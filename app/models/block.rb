class Block < ApplicationRecord
  has_one_attached :block_image
  
  belongs_to :landingpage
  
  acts_as_list
end
