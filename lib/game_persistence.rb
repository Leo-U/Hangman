# frozen_string_literal: true

module GamePersistence
  def save(game_number)
    # iterates over instance vars and makes hash of them:
    game_data = instance_variables.each_with_object({}) do |var, result|
      result[var[1..].to_sym] = instance_variable_get(var)
    end
    # serializes the hash and writes it to file:
    serialized_game = JSON.dump(game_data)
    File.write("saved_game_#{game_number}.json", serialized_game)
  rescue StandardError => e
    puts "An error occurred while saving the game: #{e.message}"
  end

  def load(game_number)
    game_data = File.read("saved_game_#{game_number}.json")
    serialized_game = JSON.parse(game_data, symbolize_names: true)
    serialized_game.each do |var, value|
      instance_variable_set("@#{var}", value)
    end
  rescue StandardError => e
    puts "An error occurred while loading the game: #{e.message}"
  end
end
