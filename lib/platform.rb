# frozen_string_literal: true

# This platform class is a collection of methods for
# displaying the game_state and graphics if you will

require_relative 'game_state'

class Platform
  def update_platform(guesses_left,letters_tried)
    padding
    puts " Letters tried: #{letters_tried}" unless letters_tried.empty?
    case guesses_left
    when 5
      zero_wrong
    when 4
      one_wrong
    when 3
      two_wrong
    when 2
      three_wrong
    when 1
      four_wrong
    when 0
      lost_game
    end
  end

  def padding
    4.times do
      puts ''
    end
  end

  def zero_wrong
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

  def one_wrong
    puts '               ========================'
    puts '               8          \\\  ||  //   '
    puts '               8           \\\ || //    '
    puts '              ***           \\\||//     '
    puts '             *0*0*           \||/      '
    puts '              *O*             ||'
    puts '              689             ||'
    puts '            *******           ||'
    puts '             *****            ||'
    puts '              ****            ||'
    puts '              ====            ||'
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

  def two_wrong
    puts '               ========================'
    puts '               8          \\\  ||  //   '
    puts '               8           \\\ || //    '
    puts '              ***           \\\||//     '
    puts '             *0*0*           \||/      '
    puts '              *O*             ||'
    puts '              689             ||'
    puts '            *******           ||'
    puts '           *******            ||'
    puts '           ** ****            ||'
    puts '           ** ====            ||'
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

  def three_wrong
    puts '               ========================'
    puts '               8          \\\  ||  //   '
    puts '               8           \\\ || //    '
    puts '              ***           \\\||//     '
    puts '             *0*0*           \||/      '
    puts '              *O*             ||'
    puts '              689             ||'
    puts '            *******           ||'
    puts '           *********          ||'
    puts '           ** **** **         ||'
    puts '           ** ==== **         ||'
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

  def four_wrong
    puts '               ========================'
    puts '               8          \\\  ||  //   '
    puts '               8           \\\ || //    '
    puts '              ***           \\\||//     '
    puts '             *0*0*           \||/      '
    puts '              *O*             ||'
    puts '              689             ||'
    puts '            *******           ||'
    puts '           *********          ||'
    puts '           ** **** **         ||'
    puts '           ** ==== **         ||'
    puts '             ****             ||'
    puts '             ***              ||'
    puts '             ***              ||'
    puts '             ***              ||'
    puts '             ====             ||'
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
