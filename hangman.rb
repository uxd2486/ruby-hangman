# frozen_string_literal: true

require_relative 'game'

def validate_input(string)
  return string if string.eql? 'save'

  string = string.downcase
  return unless string.length == 1
  return unless /\A[a-z]\z/.match string

  string
end

def save(game)
  print 'Enter a name for the save file: '
  name = gets.chomp
  game.save(name)
  puts 'Game saved. Thank you for playing!'
end

def play(game)
  until game.over?
    game.print_display
    print 'Have a guess(\'save\' to save the game): '
    guess = validate_input(gets.chomp)
    if guess.eql? 'save'
      save(game)
      return
    end
    if guess.nil?
      puts 'Invalid input'
      next
    end
    game.check_guess(guess)
    puts
  end
  game.end_message
end

def main
  puts 'Let\'s play Hangman!'
  print 'Would you like to load a game? (y/n): '
  response = gets.chomp
  if response.eql? 'y'
    print 'Please enter the name of the save file: '
    filename = gets.chomp
    game = Game.load_game(filename)
  else
    puts 'Let\'s start a new game!'
    game = Game.new
  end
  play(game)
end

main
