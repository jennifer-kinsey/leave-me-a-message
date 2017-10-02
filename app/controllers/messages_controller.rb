class MessagesController < ApplicationController
  def index
    @messages = current_user.messages.all
  end

  def new
    @message = current_user.messages.new
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = "Message successfully added"
      redirect_to messages_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id]).destroy
    if @message.destroy
      flash[:alert] = "Message successfully deleted"
      redirect_to messages_path
    end
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
