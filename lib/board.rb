class Board
  attr_reader :board_hash, :board_full, :emoji_board

  def initialize
    @emoji_board = false
    @board_full = false
    @board_hash = {A: [".",".",".",".",".",".",],
                   B: [".",".",".",".",".",".",],
                   C: [".",".",".",".",".",".",],
                   D: [".",".",".",".",".",".",],
                   E: [".",".",".",".",".",".",],
                   F: [".",".",".",".",".",".",],
                   G: [".",".",".",".",".",".",]
                  }
  end

  def toggle_emoji_board
    @emoji_board = !@emoji_board
  end

  def print_board
    if @emoji_board
      puts "🅰 🅱 🅲 🅳 🅴 🅵 🅶"
      6.times do |counter|
        board_hash.keys.each do |key|
            if board_hash[key][counter] == 'X'
              print "\u{1F7E1}"
            elsif board_hash[key][counter] == 'O'
              print "\u{1F534}"
            else
              print "⚫"
            end
          end
          puts ''
        end
    else
      puts "ABCDEFG"
      6.times do |counter|
        board_hash.keys.each do |key|
          print board_hash[key][counter]
        end
        puts ''
      end
    end
  end

  def get_user_input
    puts "Enter A-G to place a piece:"
    user_input = gets.chomp.upcase.to_sym
  end

  def is_column_full?(column)
    @board_hash[column.to_sym].include?('.')
  end

  def add_piece(column, piece)
    num_empty_spots = board_hash[column].count(".") - 1
    board_hash[column][num_empty_spots] = piece
  end

  def within_key_range(input)
    @board_hash.keys.include?(input)
  end

  def is_board_full?
    if find_valid_columns == []
      return true
    else
      return false
    end
  end

  def player_turn
    if is_board_full?
      print_board
      @board_full = true
    else
      user_input = get_user_input
      if within_key_range(user_input) == false
        puts "Invalid input, must be A-G."
        player_turn
      elsif is_column_full?(user_input) == false
        puts "Invalid input, column full, choose another column."
        player_turn
      else
        add_piece(user_input, "X")
        print_board
      end
    end
  end

  def find_valid_columns
      board_hash.keys.find_all do |check_column|
      board_hash[check_column].count(".") > 0
      end
  end

  def computer_turn
      computer_array = find_valid_columns.shuffle
      add_piece(computer_array[0], 'O')
      print_board
  end
end
