class AddReadingGoalToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reading_goal_minutes, :integer
  end
end
