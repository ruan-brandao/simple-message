class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_message, only: [:show, :destroy]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to @message
    else
      redirect_to new_message_path, alert: "The message could not be created"
    end
  end

  def destroy
    if @message.user == current_user
      @message.destroy
      redirect_to messages_path
    else
      redirect_to "/", alert: "Permission Denied"
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:text, :user)
  end
end
