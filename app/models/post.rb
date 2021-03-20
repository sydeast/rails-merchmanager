class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  validates :content, :title, presence: true

end
