class ComentsController < ApplicationController

  def index
    @coment = Coment.all
  end  


  def new
    @coment = Coment.new
  end  
  
  def create
    @coment = Coment.new(coment_params)
    if @coment.save
      redirect_to root_path
    else
      render "new"
    end
    

  end 
  
  
  private

  def coment_params
    params.require(:coment).permit(:body, :poster_id)
  end  


end
