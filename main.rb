require 'json'
require 'date'
require './classes/item'
require './classes/genre'
require './classes/music_album'
require './classes/book'
require './classes/label'
require './classes/author'
require './classes/game'
require './operations/book_operations'
require './operations/music_album_operations'
require './operations/game_operations'
require './operations/file_operations'
require './operations/item_operations'

items = load_items_from_json

puts 'Welcome to the Catalogue of my things'

def print_options
  puts "\nOptions"
  puts '1. List all books'
  puts '2. List all music albums'
  puts '3. List all games'
  puts '4. List all genres'
  puts '5. List all labels'
  puts '6. List all authors'
  puts '7. Add a book'
  puts '8. Add a music album'
  puts '9. Add a game'
  puts '10. Quit'
end

loop do
  print_options
  print 'Enter your choices: '
  choice = gets.chomp.to_i
  case choice
  when 1
    list_books(items)
  when 2
    list_music_albums(items)
  when 3
    list_games(items)
  when 4
    list_genres(items)
  when 5
    list_labels(items)
  when 6
    list_authors(items)
  when 7
    add_book(items)
  when 8
    add_music_album(items)
  when 9
    add_game(items)
  when 10
    save_items_to_json(items)
    puts 'Exiting the application. Goodbye!'
    break
  else
    puts 'Invalid choice. Please try again.'
  end
end
