# frozen_string_literal: true

# Loads dictionary from file and randomly chooses dictionary word with two public classes:
class Dictionary
  def initialize(_contents = 'placeholder')
    @contents = 'placeholder'
  end

  def load_dictionary(file_name)
    dictionary = File.open(file_name)
    @contents = dictionary.readlines
    dictionary.close
  end

  def select_word
    @contents.filter_map { |el| el.strip if el.strip.length.between?(5, 12) }.sample
  end
end
