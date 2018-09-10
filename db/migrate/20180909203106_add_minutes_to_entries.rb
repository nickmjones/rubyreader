class AddMinutesToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :minutes, :integer
  end
end
