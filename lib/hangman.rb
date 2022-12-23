class Game
  def initialize(dictionary)
    @secret_word = dictionary.select_word
    @mistakes_left = 7
    @correct_letters = []
    @incorrect_letters = []
    @display_string = '_'
  end

  def input_guess
    @guess = gets.chomp
  end

  def check_guess
    if @secret_word.include?(@guess)
      @correct_letters << @guess
    else
      @incorrect_letters << @guess
    end
  end

  def build_display_string
    @display_string = ''
    secret = @secret_word.split ''
    secret.each_with_index do |el, i|
      if @correct_letters.include?(el)
        @display_string += el + ' '
      else
        @display_string += '_ '
      end
    end
  end

  def display_game
    puts "Correct letters: #{@correct_letters * ','}"
    puts "Incorrect letters: #{@incorrect_letters * ','}"
    puts @display_string
  end

  def decrement_mistakes
    @mistakes_left -= 1 if @incorrect_letters.include?(@guess)
  end

  def update_display
    puts "Mistakes left: #{@mistakes_left}"
    puts @secret_word if @mistakes_left == 0
  end

  def display_game_over
    if @display_string.count('_').zero?
      puts "Victory!"
    elsif @display_string.include?('_') && @mistakes_left == 0
      puts "Haha an adult just lost at Hangman!"
    end
  end

  def play_game
    while @mistakes_left > 0 && @display_string.include?('_') do
      input_guess
      check_guess
      build_display_string
      display_game
      decrement_mistakes
      update_display
      display_game_over
    end
  end
end

class Dictionary
  def initialize(contents = "placeholder")
    @contents = "placeholder"
  end

  def load_dictionary(file_name)
    dictionary = File.open(file_name)
    @contents = dictionary.readlines
    dictionary.close
  end

  def select_word
    random_word = @contents.filter_map { |el| el.strip if el.strip.length.between?(5, 12)}.sample
    random_word
  end
end

dictionary = Dictionary.new
dictionary.load_dictionary('google-10000-english-no-swears.txt')
game = Game.new(dictionary)
game.play_game