class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :image, presence: true
  validates :title, presence: true
  validates :body, presence: true

  scope :visible, -> { where(hidden: false) }


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search(query)
    visible.where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%")
  end
  
end
