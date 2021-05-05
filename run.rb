# frozen_string_literal: true

require './lib/game_state'
require './lib/platform'

#############################
## Game set up / Main loop ##
def continue?
  puts " ~~~ Enter C to continue or S to save the game ~~~"
  print ' (c/s): '
  input = gets.chomp.upcase
  if input == 'C'
    puts " Then you die!"
    return true
  elsif input == 'S'
    puts "~~~ GAME SAVED ~~~"
    return false
  end
end

@play = true
def try_again?
  puts ' ...try again?'
  print '(y/n): '
  @play = gets.chomp.upcase == 'Y'
end

until @play == false
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
    game.input_guess
    # redisplay with feedback
    platform.update_platform(game.guess_count)
    game.message
    game.hidden_word
    # allow player to save game
    continue? == false ? @play == false : "hi"
  end

  ##############
  ## Game End ##
  if game.guess_count.zero?
    platform.lost_game
    try_again?

  elsif game.won?
    puts ' You won your life, now get out of my sight..'
    try_again?
  end
end
