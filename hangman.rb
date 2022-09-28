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
end

def play
  puts 'Let\'s play Hangman!'
  game = Game.new
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

play
