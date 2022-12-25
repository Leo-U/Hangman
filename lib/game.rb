# frozen_string_literal: true

require 'json'
require_relative 'game_persistence'
require_relative 'dictionary'

# Contains the code playing a complete game:
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

  # the public interface:
  def play_game
    prompt_choice
    while @mistakes_left.positive? && @display_string.include?('_')
      handle_input
      check_guess
      build_display_string
      print_display1
      decrement_mistakes
      print_display2
      print_game_over
    end
  end

  # hidden details:
  private

  def prompt_choice
    puts "Enter a letter to play Hangman. Enter 'save' or 'load' followed by a game number to load/save games."
  end

  def handle_input
    @input = gets.chomp.downcase
    action, game_number = @input.split(' ')
    return send(action, game_number) if %w[save load].include?(action)
    return if @input =~ /^[a-z]$/

    puts 'Typo. Try again.'
    handle_input
  end

  def check_guess
    if @secret_word.include?(@input) && @correct_letters.count(@input).zero?
      @correct_letters << @input
    elsif @secret_word.count(@input).zero? && @input.length == 1 && @incorrect_letters.count(@input).zero?
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

  def print_display1
    puts "Correct letters: #{@correct_letters * ','}"
    puts "Incorrect letters: #{@incorrect_letters * ','}"
    puts @display_string
  end

  def decrement_mistakes
    @mistakes_left -= 1 if @incorrect_letters.include?(@input)
  end

  def print_display2
    puts "Mistakes left: #{@mistakes_left}"
    puts @secret_word if @mistakes_left.zero?
  end

  def print_game_over
    if @display_string.count('_').zero?
      puts 'Victory!'
    elsif @display_string.include?('_') && @mistakes_left.zero?
      puts 'Haha an adult just lost at Hangman!'
    end
  end
end

dictionary = Dictionary.new
dictionary.load_dictionary('google-10000-english-no-swears.txt')
game = Game.new(dictionary)
game.play_game
