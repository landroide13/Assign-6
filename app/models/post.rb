class Post < ApplicationRecord

  #validates :body, presence: true
  belongs_to :wall_user, class_name:"User"
  belongs_to :poster, class_name:"User"
  has_many :likes, as: :item

end
