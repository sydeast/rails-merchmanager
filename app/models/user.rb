class User < ApplicationRecord
    #Associations
    has_many :artists
    has_many :photocards, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :albums, through: :artists, source: :album
    has_many :commented_posts, through: :comments, source: :post, dependent: :destroy

    #Validations:
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true
end