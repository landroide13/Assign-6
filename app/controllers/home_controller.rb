class HomeController < ApplicationController
  
  def index
    @post = Post.new
    @posts = current_user.posts + current_user.posts_on_his_wall if current_user
  end



end
