module ApplicationHelper

  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def total_minutes
    @total_minutes = Entry.select(:minutes_read).map(&:minutes_read).inject(0, :+)
    return @total_minutes
  end

  def total_pages
    @total_pages = Entry.select(:pages_read).map(&:pages_read).inject(0, :+)
    return @total_pages
  end

  def total_books
    @total_books = Entry.select(:pages_read).map(&:pages_read).uniq
    return @total_books
  end

  def minutes_today
    @minutes_today = Entry.today.select(:minutes_read).map(&:minutes_read).inject(0, :+)
    return @minutes_today
  end

    def goal_seek(goal, actual)
    @percent_complete = (goal / actual) * 100
    return @percent_complete.to_i
  end
  
end
