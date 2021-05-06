# frozen_string_literal: true

require 'json'
require './lib/game_state'
require './lib/platform'

########################
## Saved Game methods ##
def continue?
  puts ' ~~~ Enter "S" to save the game ~~~ '
  print '$~ '
  input = gets.chomp.upcase
  case input
  when 'C'
    puts ' Then you die!'
  when 'S'
    puts ''
    save_game
    puts ' ~~~ GAME SAVED ~~~'
    exit!
  end
end

def save_game
  Dir.mkdir('saved_game') unless Dir.exist?('saved_game')
  File.new('./saved_game/saved_game.json', 'w') unless File.exist?('./saved_game/saved_game.json')

  File.open('./saved_game/saved_game.json', 'w') do |file|
    file.puts JSON.generate :Game_state.to_s
  end
end

def load_saved_game?
  if File.exist?('./saved_game/savedgame.json')
    puts ' Enter "y" to load saved game'
    print '$~ '
    if gets.chomp.strip.upcase == 'Y'
      # un-serialize game_state from lib/saved_game/
      puts ' ~~ Game loaded ~~'
      # game = Game_state Loaded from file
      true
    end
  else
    false
  end
end

#############################
## Game set up / Main loop ##

def try_again?
  puts ' ...try again?'
  print '(y/n): '
  @play = gets.chomp.upcase == 'Y'
end

@play = true
until @play == false
  load_saved_game?
  game = Game_state.new
  platform = Platform.new

  ###############
  ## Game Flow ##
  until game.over? || game.won?

    # display platform according to guesses left / 5
    platform.update_platform(game.guess_count)
    # display " _ " for each letter unknown
    game.hidden_word
    # let the player input a letter
    game.message
    game.input_guess

    # redisplay with feedback
    # platform.update_platform(game.guess_count)
    # game.hidden_word
    # game.message
    # allow player to save game
    continue?
  end

  ##############
  ## Game End ##
  if game.guess_count.zero?
    platform.lost_game
    try_again?

  elsif game.won?
    puts "You've won your life, now get out of my sight.."
    try_again?
  end
end
