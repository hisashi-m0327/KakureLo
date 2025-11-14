class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  scope :visible, -> { where(hidden: false) }
end
