# frozen_string_literal: true

def pick_word
  words = IO.readlines('google-10000-english-no-swears.txt')
  chosen_word = nil
  while chosen_word.nil?
    chosen_word = words[rand(words.length)].strip
    chosen_word = nil if chosen_word.length > 12 || chosen_word.length < 5
  end
  chosen_word
end

def print_display(count, displayed_word)
  puts "Turns remaining: #{count}"
  displayed_word.each_char { |char| print "#{char} " }
end

def update_display(letter, chosen_word, displayed_word)
  index = chosen_word.index(letter)
  until index.nil?
    displayed_word[index] = letter
    index = chosen_word.index(letter, index + 1)
  end
  displayed_word
end

def play
  puts 'Let\'s play Hangman!'
  chosen = pick_word
  tries = chosen.length
  displayed = '_' * tries
  until tries.zero?
    print_display(tries, displayed)
    puts
    print 'Have a guess: '
    guess = gets.chomp.downcase
    if chosen.include? guess
      puts 'Good guess!'
      update_display(guess, chosen, displayed)
    else
      puts 'Wrong guess!'
      tries -= 1
    end
    puts
    break if chosen.eql? displayed
  end
  puts 'You win!' if chosen.eql? displayed
  puts 'You lose :(' if tries.zero?
  puts "The word is #{chosen}."
end

play
