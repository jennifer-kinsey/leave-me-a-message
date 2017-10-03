class MessagesController < ApplicationController
  before_action :authorize, except: [:create, :new]

  def index
    @messages = current_user.messages.all
  end

  def new
    @user = User.find_by(username: params[:username])
    @message = @user.messages.new
  end

  def create
    @user = User.find_by(username: params[:username])
    @message = @user.messages.new(message_params)
    if @message.save
      flash[:notice] = "Message successfully added"
      redirect_to home_path
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

  def thanks
    @user = User.find_by(username: params[:username])
  end

private
  def message_params
    params.require(:message).permit(:body, :user_id, :username)
  end
end
