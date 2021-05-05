# frozen_string_literal: true

####################
# Game_state class
class Game_state

  def initialize
    @counter = 0
    @letters_tried = []
    @incorrect_guesses = 5
    @correct_guess = 3
    @secret_word = 'CHUNGUS'
    # pick_word(intake_word_list)
    create_word_array
    @word_length = @secret_word.length
  end

  ####################
  ## Fetching
  def guess_count
    @incorrect_guesses
  end

  def won?
    # @word_array[1].all?([letter, 1])
    # no win con atm
  end

  def over?
    @incorrect_guesses.zero? ? true : false
  end

  def hidden_word
    print '     '
    @word_array.each do |letter_array|
      print ' '
      symbol = if letter_array[1] == 1
        letter_array[0].to_s
      else
        '__'
      end
      print " #{symbol}"
    end
    puts ''
  end

  ####################
  ## Player input
  def input_guess
    message
    puts " ~ #{@incorrect_guesses} guesses left ~ "
    print ' $~ '
    guess = gets.chomp.upcase
    check_guess(guess)
    @counter += 1
  end

  def message
    if @counter == 0
      puts ".. You're next. You get 5 chances, test your luck.. Else you die.."
    else
      case @correct_guess.to_i
      when 1
        puts ' Correct!'
      when 2
        puts ' Incorrect..'
      when 3
        puts " You've already tried that letter! Idiot! "
      end
    end
  end


  ##########################
  ## secret word handling
  private

  def create_word_array
    @word_array = []
    @secret_word.to_s.each_char { |char| @word_array.push([char.to_s, 0]) }
    @word_array
  end

  def intake_word_list
    src = File.open('./lib/words.txt')
    word_list = []
    src.each do |line|
      word_list << line.downcase.split
    end
    word_list
  end

  def check_guess(letter)
    # if you've already tried this letter
    p @letters_tried
    if @letters_tried.include?(letter)
      @correct_guess = 3

    else
      # if letter is correct
      if @secret_word.include?(letter)
        @correct_guess = 1
        @letters_tried.push(letter)
        @word_array.each do |letter_array|
          letter_array[0] == letter ? letter_array[1] = 1 : 0
        end

      # if letter is not found in @secret_word
      elsif @word_array.none?(letter)
        @correct_guess = 2
        @incorrect_guesses -= 1
        @letters_tried.push(letter)
      end
    end
  end

end
