dictionary = File.open('google-10000-english-no-swears.txt')
contents = dictionary.readlines
dictionary.close
random_word = contents.filter_map { |el| el.strip if el.strip.length.between?(5, 12) }.sample