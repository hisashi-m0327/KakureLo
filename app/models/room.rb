class Room < ApplicationRecord
  has_many :entries, dependent: :destroy
  has_many :users, through: :entries
  has_many :messages, dependent: :destroy

  # helper: return the other user (for 2-person rooms)
  def other_user(current_user)
    users.where.not(id: current_user.id).first
  end
end
