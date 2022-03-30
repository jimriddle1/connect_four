class Board
  require 'rspec'
  require 'pry'
  attr_reader :board_hash

  def initialize
    @board_hash = {A: [".",".",".",".",".",".",],
                   B: [".",".",".",".",".",".",],
                   C: [".",".",".",".",".",".",],
                   D: [".",".",".",".",".",".",],
                   E: [".",".",".",".",".",".",],
                   F: [".",".",".",".",".",".",],
                   G: [".",".",".",".",".",".",]

                  }
      # require 'pry'; binding pry
  end
  #
  # def print_header
  #   puts 'ABCDEFG'
  # end

  def print_board
    puts "ABCDEFG"
    counter = 0
    6.times do |counter|
      board_hash.keys.each do |key|
        print board_hash[key][counter]
      end
      puts ''
      counter += 1
    end
    return
  end



  def get_user_input
    puts "Enter A-G to place a piece:"
    user_input = gets.chomp.upcase.to_sym
  end

  def is_valid_input?(input_column)
    valid_column_array = []
    # require 'pry'; binding.pry
    board_hash.keys.each do |check_column|
      if board_hash[check_column].count(".") > 0
        valid_column_array.push(check_column)
      end
    end
      # require 'pry'; binding.pry

      return valid_column_array.include?(input_column)
  end

  def is_column_full?(column)
    # require 'pry'; binding.pry
    @board_hash[column.to_sym].include?('.')
  end

  def add_piece(column, piece)
    num_empty_spots = board_hash[column].count(".") - 1
    board_hash[column][num_empty_spots] = piece
  end

  def within_key_range(input)
    @board_hash.keys.include?(input)
  end

  def player_turn
    user_input = get_user_input
    # require 'pry'; binding.pry

    if within_key_range(user_input) == false
      puts "Invalid input, must be A-G."
      # require 'pry'; binding.pry
      player_turn
    elsif is_column_full?(user_input) == false
      puts "Invalid input, column full, choose another column."
      player_turn
    else
      add_piece(user_input, "X")
    end
  end

  def computer_turn
    input = get_user_input
    if is_valid_input(input)
      #do something
    end
  end

  def check_win_condition(array)
  counter = 0
  x_counter = 1
  array.each do |index|
    if array[counter] == "x" && array[counter + 1] == "x"
      x_counter += 1
      # require 'pry': binding.pry
    end
    counter += 1
  end
  return x_counter

end

end

# board = Board.new
# board.print_board
# require 'pry'; binding pry
