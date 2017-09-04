class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message successfully added"
      redirect_to messages_path
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    flash[:warning] = "Message successfully deleted"
    redirect_to messages_path
  end

private
  def message_params
    params.require(:message).permit(:body)
  end
end
