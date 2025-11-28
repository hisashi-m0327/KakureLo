class Public::MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user

    if @message.save
      redirect_to room_path(@room) 
    else
      @messages = @room.messages.includes(:user).order(created_at: :asc)
      render 'rooms/show', status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = current_user.rooms.find(params[:room_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
