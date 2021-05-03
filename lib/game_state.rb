
# Game_state class creates an instance of the game.
class Game_state
  attr_reader :word_length, :correct_guess

  def initialize
    intake_word_list
    @correct_guess = false
    @secret_word = "Chungus"
    @word_length = @secret_word.length


  end

  def intake_word_list
    src = File.open("./lib/words.txt")
    word_list = []
    src.each do |line|
      word_list << line.downcase.split
    end

    p word_list
  end

  def pick_word

    p words[10]
  end

  def lost_game?
    false
  end



end
