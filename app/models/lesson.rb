class Lesson < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :subtitle, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
end
