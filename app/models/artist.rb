class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_many :photocards


  scope :public_viewing, -> { where(status: "public") }
  scope :listed_by_name, -> { order(:name) }


  def album_attributes=(attr)
    self.album = Album.find_or_create_by(attr) if !attr[:title].blank?
  end

end
