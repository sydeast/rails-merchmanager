class User < ApplicationRecord
    #Associations
    has_many :artists
    has_many :photocards
    has_many :albums, {:through=>:artists, :source=>"album"}

    #Validations:
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true
end