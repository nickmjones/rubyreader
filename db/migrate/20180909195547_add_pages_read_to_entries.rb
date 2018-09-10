class AddPagesReadToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :pages_read, :integer
  end
end
