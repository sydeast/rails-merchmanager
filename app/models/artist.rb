class Artist < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_many :photocards


  scope :noshow, -> { where(status: 'private') }


  def album_attributes=(attr)
    self.album = Album.find_or_create_by(attr) if !attr[:title].blank?
  end

end
