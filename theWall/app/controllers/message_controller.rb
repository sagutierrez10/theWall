class MessageController < ApplicationController
  def new
    @messages = Message.all
  end



  def logout
    p 'yolo'
    session.clear
    redirect_to users_new_path
  end

  def create
    
    @user = User.find_by(username: session[:username])
    # @message = Message.new(message_params)
    @message = @user.messages.new(message_params)

    if @message.save
      flash[:notice] = ["Message successfully created"]
    else
      flash[:notice] = ["Message not created"]
    end
    redirect_to message_new_path
  end

  private
  def message_params
    params.require(:message).permit(:message)
  end
end
