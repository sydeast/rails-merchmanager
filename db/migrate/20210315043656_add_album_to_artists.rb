class AddAlbumToArtists < ActiveRecord::Migration[6.1]
  def change
    add_reference :artists, :album, null: false, foreign_key: true
  end
end
