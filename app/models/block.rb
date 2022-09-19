class Block < ApplicationRecord
  belongs_to :landingpage
  
  acts_as_list
end
