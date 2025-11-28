class Public::RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms.includes(:users, messages: :user)
  end

  def create
    other_user = User.find(params[:user_id])
    # 既存のroomを探す（2人ルームを想定）
    room = Room.joins(:entries)
               .where(entries: { user_id: [current_user.id, other_user.id] })
               .group('rooms.id')
               .having('COUNT(rooms.id) = 2')
               .first

    unless room
      room = Room.create!
      room.entries.create!(user: current_user)
      room.entries.create!(user: other_user)
    end

    redirect_to room_path(room)
  end

  def show
    @room = current_user.rooms.find(params[:id]) # 権限チェック
    @messages = @room.messages.includes(:user).order(created_at: :asc).limit(100)
    @message = Message.new
  end
end
