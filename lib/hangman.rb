class Game
  def initialize
    dictionary = Dictionary.new
    dictionary.load_dictionary('google-10000-english-no-swears.txt')
    @secret_word = dictionary.select_word

    @mistakes_left = 7
    @correct_letters = []
    @incorrect_letters = []
    @display_str = ''
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
    secret.each_with_index do |el, i|
      if @correct_letters.include?(el)
        @display_str += el + ' '
      else
        @display_str += '_ '
      end
    end
    puts @display_str
  end

  def play_game
    until @mistakes_left == 0 do
      self.input_guess(gets.chomp)
      self.check_letter
      puts "Correct letters: #{@correct_letters * ','}"
      puts "Incorrect letters: #{@incorrect_letters * ','}"
      self.display_game

      @mistakes_left -= 1 if @incorrect_letters.include?(@guess)
      puts "Mistakes left: #{@mistakes_left}"
      puts @secret_word if @mistakes_left == 0
      if 
      end
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
    random_word = @contents.filter_map { |el| el.strip if el.strip.length.between?(5, 12) }.sample
    random_word
  end
end

game = Game.new
game.play_game