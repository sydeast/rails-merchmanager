class CreatePhotocards < ActiveRecord::Migration[6.1]
  def change
    create_table :photocards do |t|
      t.string :title
      t.string :print_type
      t.string :source_type
      t.string :source_name
      t.string :card_type
      t.integer :card_num
      t.integer :card_setnum
      t.string :card_notes
      t.references :user, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
