# frozen_string_literal: true

require 'json'

module GamePersistence
  def save_game
    # iterates over instance vars and makes hash of them:
    game_data = instance_variables.each_with_object({}) do |var, result|
      result[var[1..].to_sym] = instance_variable_get(var)
    end
    # serializes the hash and writes it to file:
    serialized_game = JSON.dump(game_data)
    File.write('saved_game.json', serialized_game)
    rescue StandardError => e
      puts "An error occurred while saving the game: #{e.message}"
  end

  def load_game
    game_data = File.read('saved_game.json')
    serialized_game = JSON.parse(game_data, symbolize_names: true)
    serialized_game.each do |var, value|
      instance_variable_set("@#{var}", value)
    end
    rescue StandardError => e
      puts "An error occurred while loading the game: #{e.message}"
  end
end

class Game
  include GamePersistence

  def initialize(dictionary)
    @secret_word = dictionary.select_word
    @mistakes_left = 7
    @correct_letters = []
    @incorrect_letters = []
    @display_string = '_'
    @input = ''
  end

  def handle_input
    @input = gets.chomp.downcase
    if @input == 'save game'
      save_game
    elsif @input == 'load game'
      load_game
    elsif @input != 'save game' && @input != 'load game' && @input.length != 1
      puts 'Typo. Try again.'
      @input = gets.chomp.downcase
    end
  end

  def check_guess
    if @secret_word.include?(@input)
      @correct_letters << @input
    elsif !@secret_word.include?(@input) && @input.length == 1
      @incorrect_letters << @input
    end
  end

  def build_display_string
    @display_string = ''
    secret = @secret_word.split ''
    secret.each_with_index do |el, _i|
      @display_string += if @correct_letters.include?(el)
                           "#{el} "
                         else
                           '_ '
                         end
    end
  end

  def prompt_choice
    puts "Enter a letter to play Hangman, or enter 'save game' or 'load game' at any time during play."
  end

  def display_game
    puts "Correct letters: #{@correct_letters * ','}"
    puts "Incorrect letters: #{@incorrect_letters * ','}"
    puts @display_string
  end

  def decrement_mistakes
    @mistakes_left -= 1 if @incorrect_letters.include?(@input)
  end

  def update_display
    puts "Mistakes left: #{@mistakes_left}"
    puts @secret_word if @mistakes_left.zero?
  end

  def display_game_over
    if @display_string.count('_').zero?
      puts 'Victory!'
    elsif @display_string.include?('_') && @mistakes_left.zero?
      puts 'Haha an adult just lost at Hangman!'
    end
  end

  def play_game
    prompt_choice
    while @mistakes_left.positive? && @display_string.include?('_')
      handle_input
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

dictionary = Dictionary.new
dictionary.load_dictionary('google-10000-english-no-swears.txt')
game = Game.new(dictionary)
game.play_game
