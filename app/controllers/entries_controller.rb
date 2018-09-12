class EntriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_entry, only: [:edit, :show, :update, :destroy]

  def index
    @total_minutes = Entry.select(:minutes_read).map(&:minutes_read).inject(0, :+)
    @total_pages = Entry.select(:pages_read).map(&:pages_read).inject(0, :+)
    @total_books = Entry.select(:pages_read).map(&:pages_read).uniq
    @today_minutes = Entry.today.by_user(current_user).select(:minutes_read).map(&:minutes_read).inject(0, :+)
    @entries_today = Entry.today.by_user(current_user).order('created_at DESC')
  end

  def edit
    @books = Entry.select(:book_title).map(&:book_title)
  end

  def show
  end

  def new
    @books = Entry.select(:book_title).map(&:book_title)
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path, notice: "I added your progress. Good job!"
    else
      render 'new'
    end
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to root_path, notice: "I updated your progress!"
    else
      render 'new'
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to root_path, notice: "I deleted that status."
  end

  # /archive
  def archive
    @this_user = current_user.id
    @entries = Entry.by_user(current_user).all.order('created_at DESC')
  end

  # /thisweek
  def thisweek
    @this_user = current_user.id
    @week_minutes = Entry.thisweek.select(:minutes_read).map(&:minutes_read).inject(0, :+)
    @entries = Entry.by_user(current_user).thisweek.all.order('created_at ASC')
  end

  private

    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:book_title, :genre, :pages_read, :genre, :minutes_read, :user_id)
    end

end