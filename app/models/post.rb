class Post < ApplicationRecord
  #Associations
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  #Validations
  validates :content, :title, presence: true

  #Scopes
  scope :most_comments, -> {left_joins(:comments).group('posts.id').order('count(comments.post_id) desc')}
  scope :most_recent, -> {order(created_at: :desc).limit(10)}

end
