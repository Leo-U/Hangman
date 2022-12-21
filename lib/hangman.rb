class Game
  def input_guess (guess)
    @guess = guess
  end

  def display_game_status
  end

  def start_game
    dictionary = Dictionary.new
    dictionary.load_dictionary('google-10000-english-no-swears.txt')
    @secret_word = dictionary.select_word

    @guesses_left = 7
    @right_letters = []
    @wrong_letters = []
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
    random_word = @contents.filter_map { |el| el.strip if el.strip.length.between?(5, 12) }.sample
    puts random_word
  end
end


