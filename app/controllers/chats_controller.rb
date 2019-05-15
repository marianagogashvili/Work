class ChatsController < ApplicationController

  def show
    @chat = Chat.includes(:messages).find_by(params[:id])  
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      redirect_to chats_path
    else
      render 'new'
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:title)
  end
end