class ConvertGoalToFloatInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :reading_goal_minutes, :float
  end
end
