module ApplicationHelper

  def goal_seek(goal, actual)
    @percent_complete = (goal / actual) * 100
    return @percent_complete.to_i
  end
  
end
