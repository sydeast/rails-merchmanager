class User < ApplicationRecord
    #Associations
    has_many :artists
    has_many :photocards
    has_many :posts
    has_many :comments
    has_many :albums, through: :artists, source: :album
    has_many :commented_posts, through: :comments, source: :post

    #Validations:
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true
end