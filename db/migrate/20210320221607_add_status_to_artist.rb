class AddStatusToArtist < ActiveRecord::Migration[6.1]
  def change
    add_column :artists, :status, :string
  end
end
