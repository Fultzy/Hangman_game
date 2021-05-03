
# This platform class is a collection of methods for
# displaying the game_state and graphics if you will

require_relative 'game_state'

class Platform
  def initialize

  end

  def hidden_word(length)
    
  end

  def play_mat
    puts '               ========================'
    puts '               8          \\\  ||  //   '
    puts '               8           \\\ || //    '
    puts '                            \\\||//     '
    puts '                             \||/      '
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '                              ||'
    puts '     ==============================='
    puts '        ||                    ||    '
    puts '########||####################||######'


  end


  def lost_game
    puts '               ========================'
    puts ' You Died!     8          \\\  ||  //   '
    puts '               8           \\\ || //    '
    puts '   Bad Luck!  ***           \\\||//     '
    puts '             *x*x*           \||/      '
    puts '              *O*             ||'
    puts '              689             ||'
    puts '            *******           ||'
    puts '           *********          ||'
    puts '           ** **** **         ||'
    puts '           ** ==== **         ||'
    puts '             ******           ||'
    puts '             *** ***          ||'
    puts '             *** ***          ||'
    puts '             *** ***          ||'
    puts '             ==== ====        ||'
    puts '                              ||'
    puts '     ==============================='
    puts '        ||                    ||    '
    puts '########||####################||######'
  end


end
