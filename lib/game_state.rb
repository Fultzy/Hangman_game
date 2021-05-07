# frozen_string_literal: true

####################
# Game_state class
class Game_state
  attr_accessor :incorrect_guesses, :word_array, :letters_tried, :counter,
                :secret_word, :feedback_val

  def initialize
    @counter = 0
    @feedback_val = 0
    @incorrect_guesses = 5
    @letters_tried = []
    @secret_word = intake_word_list
    create_word_array
  end

  ###################
  ## SaveGame

  def state_hash
    state_hash = {
      counter: @counter,
      feedback_val: @feedback_val,
      incorrect_guesses: @incorrect_guesses,
      letters_tried: @letters_tried,
      secret_word: @secret_word,
      word_array: @word_array
    }
  end

  def load_state_hash
    hash = JSON.parse(File.read('./saved_game/saved_game.json', 'r'))
    @counter = hash['counter']
    @feedback_val = hash['feedback_val']
    @incorrect_guesses = hash['incorrect_guesses']
    @letters_tried = hash['letters_tried']
    @secret_word = hash['secret_word']
    @word_array = hash['word_array']
  end

  def save_game
    Dir.mkdir('saved_game') unless Dir.exist?('saved_game')
    File.new('./saved_game/saved_game.json', 'w') unless File.exist?('./saved_game/saved_game.json')

    File.open('./saved_game/saved_game.json', 'w') do |file|
      file.puts state_hash.to_json
    end
  end

  ####################
  ## Fetching
  def show_word
    puts " word was: #{@secret_word}."
  end
  def guess_count
    @incorrect_guesses
  end

  def letters_tried
    @letters_tried
  end

  # no win con atm
  def won?
    # @word_array[1].all?([letter, 1])
  end

  def over?
    @incorrect_guesses.to_i.zero? ? true : false
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
    puts "          ~ #{@incorrect_guesses} guesses left ~ "
    print ' letter:  '
    input = gets.chomp.upcase
    if input == 'SAVE'
      save_game
      puts "  Game Saved"
      exit
    else
      check_guess(input)
    @counter += 1
    end
  end

  def message
    sleep(0.5)
    if @counter.to_i.zero?
      puts ".. You're next. You get 5 chances, test your luck.. Else you die.."
    else
      case @feedback_val
      when :correct
        puts ' Correct!'
      when :incorrect
        puts ' Incorrect..'
      when :already_tried
        puts " You've already tried that letter! Idiot! "
      end
    end
    sleep(1)
  end

  ##########################
  ## secret word handling
  private

  def intake_word_list
    word_list = []
    src = File.open('./lib/words.txt', 'r')
    src.flat_map { |line| word_list << line.upcase.split(/[^[:alpha:]]/).reject(&:empty?) }
    p word_list.delete_if { |word| word.length < 4 && word.length > 12 }
    word = word_list[rand(1..word_list.size)].to_s.gsub(/[^A-Za-z0-9 ]/, '')
  end

  def create_word_array
    @word_array = []
    @secret_word.to_s.each_char { |char| @word_array.push([char.to_s, 0]) }
    p @word_array
  end

  def check_guess(letter)
    # if you've already tried this letter
    p @letters_tried
    if @letters_tried.include?(letter)
      @feedback_val = :already_tried

      # if letter is correct
    elsif @secret_word.include?(letter)
      @feedback_val = :correct
      @letters_tried.push(letter)
      @word_array.each do |letter_array|
        letter_array[0] == letter ? letter_array[1] = 1 : 0
      end

      # if letter is not found in @secret_word
    elsif @word_array.none?(letter)
      @feedback_val = :incorrect
      @incorrect_guesses -= 1
      @letters_tried.push(letter)
    end
  end
end
