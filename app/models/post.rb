class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :area
  has_many :reviews
  has_one_attached :image, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end


end
