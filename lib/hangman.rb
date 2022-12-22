class Game
  
  attr_reader :correct_letters, :incorrect_letters
  def del_me
    @correct_letters = []
  end

  def initialize_game
    dictionary = Dictionary.new
    dictionary.load_dictionary('google-10000-english-no-swears.txt')
    @secret_word = dictionary.select_word

    @guesses_left = 7
    @correct_letters = []
    @incorrect_letters = []
  end

  def input_guess (guess)
    @guess = guess
  end

  def check_letter(letter = @guess)
    if @secret_word.include?(letter)
      @correct_letters << letter
    else
      @incorrect_letters << letter
    end
  end

  def display_game
    secret = @secret_word.split ''
    puts @secret_word
    display_str = ''
    secret.each_with_index do |el, i|
      if @correct_letters.include?(el)
        display_str += el + ' '
      else
        display_str += '_ '
      end
    end
    puts display_str
  end



    #needs to display correct and incorrect letters. just print to console.
    #also print remaining guesses.

    #1. display remaining guesses
    #2. display word with underscores and spaces
      #A) display spaced underscore sequence with length of word. 
      #B) replace corresponding underscores with correctly guessed letters
    
    


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
    random_word
  end
end
game = Game.new
game.del_me


game.initialize_game
50.times do
game.input_guess(gets.chomp)
game.check_letter
p game.correct_letters
p game.incorrect_letters
game.display_game

end