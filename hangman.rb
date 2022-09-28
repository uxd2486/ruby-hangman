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
