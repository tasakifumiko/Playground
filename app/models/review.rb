class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :comment, presence: true
  
  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
  
  
end
