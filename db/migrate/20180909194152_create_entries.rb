class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.string :book_title
      t.text :book_notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
