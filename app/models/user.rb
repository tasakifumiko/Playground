class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_one_attached :profile_image, dependent: :destroy

   def get_profile_image(width, height)
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
    profile_image.variant(resize_to_limit: [width, height]).processed
   end
end
