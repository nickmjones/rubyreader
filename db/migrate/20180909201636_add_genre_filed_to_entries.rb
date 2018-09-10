class AddGenreFiledToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :genre, :string
  end
end
