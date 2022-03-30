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

  def place_piece(column)


  end

  def get_user_input
    puts "Enter A-G to place a piece:"
    user_input = gets.chomp.upcase

  end

  def is_valid_input?(column)
    valid_column_array = ['A','B','C','D','E','F','G']
    valid_column_array.include?(column)
  end

  def is_column_full?(column)
    board_hash[column.to_sym].include?('.')
  end

  def add_piece(column, piece)
    # num_empty_spots = board_hash[column].count(".")
    board_hash[column].push(piece)
    board_hash[column].shift


  end

  #   i = 0
  #   matrix = Array.new(7) { Array.new(7, '.') }
  #   matrix.each do |sub|
  #     sub.each do |coord|
  #     print coord
  #     i += 1
  #     if (i == 7)
  #       puts ''
  #       i = 0
  #     end
  #   end
  # end

  end

board = Board.new
board.print_board
# require 'pry'; binding pry
