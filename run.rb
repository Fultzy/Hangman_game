# frozen_string_literal: true

require 'json'
require './lib/game_state'
require './lib/platform'

########################
## Saved Game methods ##

def load_saved_game?
  if File.exist?('./saved_game/saved_game.json')
    puts ' Enter "L" to load saved game'
    print '$~ '
    gets.chomp.strip.upcase == 'L'
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
  platform = Platform.new
  platform.zero_wrong

  if load_saved_game?
    @game = Game_state.new
    @game.load_state_hash
    puts ' ~~ Game loaded ~~'
  else
    @game = Game_state.new
    @game.message
    puts '   .. You can enter "save" at any point to save the game..'
    sleep(2)
  end

  ###############
  ## Game Flow ##
  until @game.over? || @game.won?

    # display platform according to guesses left
    platform.update_platform(@game.guess_count, @game.letters_tried)
    @game.hidden_word
    @game.input_guess

    # redisplay with feedback
    platform.update_platform(@game.guess_count, @game.letters_tried)
    @game.hidden_word
    @game.message
    puts ''

  end

  ##############
  ## Game End ##
  if @game.guess_count.to_i.zero?
    platform.padding
    platform.lost_game
    try_again?

  elsif @game.won?
    puts "You've won your life, now get out of my sight.."
    try_again?
  end
end
