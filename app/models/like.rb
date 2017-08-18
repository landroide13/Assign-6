class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true

  before_action :authenticate_user! # devise method to help ensure logging in
  
 def toggle
   if params[:post_id]
     item = Post.find params[:post_id]
   end
   
   current_user.toggle_like!(item)
 end

end