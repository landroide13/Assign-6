class MessagesController < ApplicationController

  def index
    redirect_to inbox_messages_path
  end 

  def inbox
    @messages = current_user.recivied_messages
  end

  def sent
    @messages = current_user.sent_messages
  end  

  def new
    @message = Message.new
  end
  
  def create
    @message = current_user.sent_messages.build message_params
    if @message.save
      redirect_to send_messages_path
      else
     flash.now:[:error] = "Error : #{message.errors.full_messages.to_sentence}"
     render "new"
    end 
  end 

  private

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end
  
   
end
