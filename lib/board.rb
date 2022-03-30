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
    board_hash[column.to_sym].include?('.')
  end

  def add_piece(column, piece)
    num_empty_spots = board_hash[column].count(".") - 1
    board_hash[column][num_empty_spots] = piece
  end

  def player_turn
    input = get_user_input
    # require 'pry'; binding.pry
    if is_valid_input?(input)
      puts "Invalid input, must be A-G."
      player_turn
    end
    if is_column_full?(input)
      puts "Invalid input, column full, choose another column."
    end
    add_piece(input, "X")
  end

  def computer_turn
    input = get_user_input
    if is_valid_input(input)
      #do something
    end
  end

end

# board = Board.new
# board.print_board
# require 'pry'; binding pry
