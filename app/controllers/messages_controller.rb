class MessagesController < ApplicationController
  before_action :authorize, except: [:create, :new, :thanks]

  def index
    @messages = current_user.messages.all
  end

  def new
    puts "in NEW"
    @user = User.find_by(username: params[:username])
    puts "user is #{@user.username}"
    @message = @user.messages.new
    puts "message is #{@message.body}"
  end

  def create
    puts "in CREATE"
    @user = User.find_by(username: params[:username])
    puts "user is #{@user}"
    @message = @user.messages.new(message_params)
    puts "message is #{@message}"
    if @message.save
      flash[:notice] = "Message successfully added"
      # redirect_to :controller => 'thanks', :action => 'index'
      # redirect_to '/thanks'
      redirect_to thanks_path
    else
      binding.pry
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
