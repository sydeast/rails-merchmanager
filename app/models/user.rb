class User < ApplicationRecord
    #Associations
    has_many :artists, dependent: :destroy
    has_many :photocards, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :albums, through: :artists, source: :album
    has_many :commented_posts, through: :comments, source: :post

    #Validations:
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :name, presence: true

    #Scopes:
    scope :most_posts, -> {left_joins(:posts).group('users.id').order('count(posts.user_id) desc')}

    def self.from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(15)
        end
    end

    def self.most_photocards
        joins(:photocards).where("photocards.created_at >= ?", 1.week.ago.utc).group('user_id').order("count(user_id) DESC").limit(10)
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end