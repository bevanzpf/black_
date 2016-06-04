class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :work
  default_scope-> { order(created_at: :desc) }
  validates :body, presence: true
  validates :body, uniqueness: { scope: [:work_id, :user_id], message: '请勿重复提交'}


end
