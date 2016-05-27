class Work < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }

  validates :subject, presence: true
  validates :desc, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

  def make_by?(user)
    self.user_id == user.id
  end
end
