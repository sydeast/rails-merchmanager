class AddStatusToPhotocards < ActiveRecord::Migration[6.1]
  def change
    add_column :photocards, :status, :string
  end
end
