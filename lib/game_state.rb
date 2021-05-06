# frozen_string_literal: true

####################
require 'pry'

# Game_state class
class Game_state
  def initialize
    @counter = 0
    @correct_guess = 0
    @incorrect_guesses = 5
    @letters_tried = []
    intake_word_list
    @secret_word = 'CHUNGUS'
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
    puts " ~ #{@incorrect_guesses} guesses left ~ "
    print ' $~ '
    check_guess(gets.chomp.upcase)
    @counter += 1
  end

  def message
    if @counter.zero?
      puts ".. You're next. You get 5 chances, test your luck.. Else you die.."
    else
      case @correct_guess
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

  def intake_word_list
    word_list = []
    src = File.open('./lib/words.txt', 'r')
    src.flat_map { |line| word_list << line.downcase.split(/[^[:alpha:]]/).reject(&:empty?) }
    word_list.delete_if { |word| word.length > 4 && word.length < 12 }
    word_list[rand(1..word_list.size)]
  end

  def pick_word(list)
    list.each(&:length)
  end

  def create_word_array
    @word_array = []
    @secret_word.to_s.each_char { |char| @word_array.push([char.to_s, 0]) }
    @word_array
  end

  def check_guess(letter)
    # if you've already tried this letter
    p @letters_tried
    if @letters_tried.include?(letter)
      @correct_guess = 3

      # if letter is correct
    elsif @secret_word.include?(letter)
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
