class Game

end

class Dictionary
  def initialize(contents = "placeholder")
    @contents = "placeholder"
  end

  def load_dictionary
    dictionary = File.open('google-10000-english-no-swears.txt')
    @contents = dictionary.readlines
    dictionary.close
  end

  def select_word
    random_word = @contents.filter_map { |el| el.strip if el.strip.length.between?(5, 12) }.sample
    puts random_word
  end
end

dictionary = Dictionary.new
dictionary.load_dictionary
dictionary.select_word
