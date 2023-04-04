class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :area
  has_many :tags
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  
  validates :playground, presence: true
  validates :title, presence: true
  validates :text, presence: true
  validates :genre_id, presence: true
  validates :area_id, presence: true
  validates :images, presence: true


  def get_image
    unless images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    images
  end
  
  def bookmark_by?(user)
    bookmarks.exists?(user_id: user.id)
  end


end

