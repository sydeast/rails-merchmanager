class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.date :birth_date
      t.integer :age
      t.string :other_name
      t.string :position
      t.string :company
      t.string :artist_notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
