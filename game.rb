class Game
  def initialize
    @chosen = pick_word
    @tries = @chosen.length
    @displayed = '_' * @tries
  end

  def pick_word
    words = IO.readlines('google-10000-english-no-swears.txt')
    chosen_word = nil
    while chosen_word.nil?
      chosen_word = words[rand(words.length)].strip
      chosen_word = nil if chosen_word.length > 12 || chosen_word.length < 5
    end
    chosen_word
  end

  def print_display
    puts "Turns remaining: #{@tries}"
    @displayed.each_char { |char| print "#{char} " }
    puts
  end

  def update_display(letter)
    index = @chosen.index(letter)
    until index.nil?
      @displayed[index] = letter
      index = @chosen.index(letter, index + 1)
    end
  end

  def check_guess(guess)
    if @chosen.include? guess
      puts 'Good guess!'
      update_display(guess)
    else
      puts 'Wrong guess!'
      @tries -= 1
    end
  end

  def over?
    @tries.zero? || @chosen.eql?(@displayed)
  end

  def end_message
    puts 'You win!' if @chosen.eql? @displayed
    puts 'You lose :(' if @tries.zero?
    puts "The word is #{@chosen}."
  end

  def save(filename)
    Dir.mkdir('saves') unless Dir.exist?('saves')
    filename = "saves/#{filename}.save"

    File.open(filename, 'w') do |file|
      file.puts @chosen
      file.puts @displayed
      file.puts @tries
      filename
    end
  end
end
