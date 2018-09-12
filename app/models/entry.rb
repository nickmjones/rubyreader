class Entry < ApplicationRecord

  belongs_to :user

  scope :by_user, lambda { |user|
    where(:user_id => user.id)
  }
  scope :today, -> { 
    where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) 
  }
  scope :thisweek, -> { 
    where(created_at: DateTime.now.beginning_of_week..DateTime.now) 
  }

end
