class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :user_id
  # 一つのユーザーは同じ投稿に対して一回しかブックマークができませんというバリデーション
  
  
end
