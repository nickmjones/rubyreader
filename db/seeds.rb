require 'faker'

p "Clearing all data..."
Entry.destroy_all

p "Adding test books..."
50.times do
  Entry.create!(
    book_title: Faker::Book.title,
    book_notes: Faker::Lorem.sentence(4),
    pages_read: Faker::Number.between(1, 68),
    minutes_read: Faker::Number.between(10, 60),
    user_id: 1,
    genre: Faker::Book.genre
  )
end
p "Done. Created 50 text books."