class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :lessons
  has_many :attendances
  has_many :att_lessons, through: :attendances, source: :lesson, dependent: :destroy
  def timeline
    Lesson.all
  end
  
  def attendance(lesson)
      self.attendances.find_or_create_by(lesson_id: lesson.id)
  end

  def unattendance(lesson)
    attendance = self.attendances.find_by(lesson_id: lesson.id)
    attendance.destroy if attendance
  end

  def att_lesson?(lesson)
    self.att_lessons.include?(lesson)
  end
end
