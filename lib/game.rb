# frozen_string_literal: true

require 'json'
require_relative 'game_persistence'
require_relative 'dictionary'

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
    loop do
      @input = gets.chomp.downcase
      if @input == 'save game' || @input == 'load game' ||  @input =~ /^[a-z]$/
        break
      else
        puts 'Typo. Try again.'
      end
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
      @display_string +=
        if @correct_letters.include?(el)
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

dictionary = Dictionary.new
dictionary.load_dictionary('google-10000-english-no-swears.txt')
game = Game.new(dictionary)
game.play_game
