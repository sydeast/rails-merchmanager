class Artist < ApplicationRecord
  #Associations
  belongs_to :user
  belongs_to :album
  has_many :photocards

  #Validations
  validates :name, :album, presence: true

  #Scopes
  scope :public_viewing, -> { where(status: "public") }
  scope :private_only, -> { where(status: "private") }
  scope :listed_by_name, -> { order(:name) }
  scope :most_photocards, -> {left_joins(:photocards).group('artists.id').order('count(photocards.artist_id) desc')}


  def album_attributes=(attr)
    self.album = Album.find_or_create_by(attr) if !attr[:title].blank?
  end

end
