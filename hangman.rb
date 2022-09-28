# frozen_string_literal: true

require_relative 'game'

def validate_input(string)
  string = string.downcase
  return unless string.length == 1
  return unless /\A[a-z]\z/.match string

  string
end

def play
  puts 'Let\'s play Hangman!'
  game = Game.new
  until game.over?
    game.print_display
    print 'Have a guess: '
    guess = validate_input(gets.chomp)
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
