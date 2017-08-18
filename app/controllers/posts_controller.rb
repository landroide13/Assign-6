class PostsController < ApplicationController

  #before_action :require_login

  def new
    @post = Post.new
    
  end  

  def create
    @post = current_user.posts.build post_params
  
    if @post.save
      flash[:success] = 'Post created'
      redirect_to root_path
    else
      flash[:error] = @post.errors.full_messages.to_sentence
      render 'new'
    end
    
  end 
  
  def post_params
    params.require(:post).permit(:body, :poster_id, :wall_user_id)
  end





end
