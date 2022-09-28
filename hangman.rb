# frozen_string_literal: true

def pick_word
  words = IO.readlines('google-10000-english-no-swears.txt')
  chosen_word = nil
  while chosen_word.nil?
    chosen_word = words[rand(words.length)]
    chosen_word = nil if chosen_word.length > 12 || chosen_word.length < 5
  end
  chosen_word
end
