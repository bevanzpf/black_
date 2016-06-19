class Work < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }

  validates :subject, presence: { message: "hey,不写个主题吗"}
  validates :desc, presence: { message: "请添加作品描述"}, length: { maximum: 255 }
  validates :user_id, presence: true
  validates :picture, presence: {message: "图片不能为空"}

  def make_by?(user)
    self.user_id == user.id
  end
end
