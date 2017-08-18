class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true

  #before_action :authenticate_user! # devise method to help ensure logging in
  
end
