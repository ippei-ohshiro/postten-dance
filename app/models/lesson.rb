class Lesson < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :subtitle, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :comment, length: { maximum: 255 }
  
  has_many :attendances
  has_many :att_users, through: :attendances, source: :user, dependent: :destroy
  
end
