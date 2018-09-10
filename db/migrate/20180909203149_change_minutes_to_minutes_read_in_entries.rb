class ChangeMinutesToMinutesReadInEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :minutes
    add_column :entries, :minutes_read, :integer
  end
end
