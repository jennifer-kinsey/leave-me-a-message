class MessagesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @messages = @user.messages.all
  end

  def new
    @user = User.find(params[:user_id])
    @message = @user.messages.new
  end

  def create
    @user = User.find(params[:user_id])
    @message = @user.messages.new(message_params)
    if @message.save
      flash[:notice] = "Message successfully added"
      redirect_to user_messages_path
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @message = Message.find(params[:id])
    @message.destroy
    flash[:warning] = "Message successfully deleted"
    redirect_to user_messages_path
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
