# require '.lib/board'
# require 'pry'
class Turn

attr_reader :board, :game_over
  def initialize(board)
    @game_over = false
    @board = board
  end

  def takes_turn
    # binding.pry
    board.player_turn
    if (check_horizontal == "X" || check_vertical == "X" ||
       check_diagonal_up_right == "X" || check_diagonal_down_right == "X") #check_diagonal_2 == "X")
      puts "Congrats! the player has won the game!"
      @game_over = true
    end
    if board.board_full == true
      @game_over = true
    end
    if @game_over == false
      board.computer_turn
      if (check_horizontal == "O" || check_vertical == "O" ||
         check_diagonal_up_right == "O" || check_diagonal_down_right == "O")#check_diagonal_2 == "O")
        puts ""
        13.times do
          print "\u{1F6A8}"
        end
        puts ""
        puts "MACHINE TAKEOVER IMMINENT!"
        13.times do
          print "\u{1F6A8}"
        end
        puts ""
        @game_over = true
      end
    end
  end

  def check_horizontal
    winner_array = []
    winner = ""
    #binding.pry
    index_counter = 0
    7.times do
      check_array = []
      board.board_hash.keys.each do |key|
        check_array << (board.board_hash[key][index_counter])
      end
      index_counter += 1
      #binding.pry
      winner_array << check_win_condition(check_array)
    end
    #binding.pry
    if winner_array.include?("X")
      winner = "X"
    elsif winner_array.include?("O")
      winner = "O"
    else
      winner = ""
    end
    return winner
  end

  def check_diagonal_up_right
    winner_array = []
    winner = ""
    custom_key_array = [6, 6, 6, 5, 4, 3]
    starting_index_array = [2, 1, 0, 0, 0, 0]
    length_array = [4, 5, 6, 6, 5, 4]
      6.times do
        check_array = []
        index_counter = starting_index_array[0]
        key_counter = custom_key_array[0]
        length_array[0].times do
          check_array << (board.board_hash[board.board_hash.keys[key_counter]][index_counter])
          index_counter += 1
          key_counter -= 1
        end
        #puts check_array
        winner_array << check_win_condition(check_array)
        custom_key_array.shift
        starting_index_array.shift
        length_array.shift
      end
    if winner_array.include?("X")
      winner = "X"
    elsif winner_array.include?("O")
      winner = "O"
    else
      winner = ""
    end
    return winner
  end

  def check_diagonal_down_right
    winner_array = []
    winner = ""
    custom_key_array = [0, 0, 0, 1, 2, 3]
    starting_index_array = [2, 1, 0, 0, 0, 0]
    length_array = [4, 5, 6, 6, 5, 4]
      6.times do
        check_array = []
        index_counter = starting_index_array[0]
        key_counter = custom_key_array[0]

        length_array[0].times do

          check_array << (board.board_hash[board.board_hash.keys[key_counter]][index_counter])
          index_counter += 1
          key_counter += 1

        end
        winner_array << check_win_condition(check_array)
        custom_key_array.shift
        starting_index_array.shift
        length_array.shift
      end
    if winner_array.include?("X")
      winner = "X"
    elsif winner_array.include?("O")
      winner = "O"
    else
      winner = ""
    end
    return winner
  end

  def check_vertical
    # binding.pry
    winner_array = []
    winner = ""
    board.board_hash.keys.each do |key|
      winner_array << check_win_condition(board.board_hash[key])
    end
    # binding.pry
    if winner_array.include?("X")
      winner = "X"
    elsif winner_array.include?("O")
      winner = "O"
    else
      winner = ""
    end
    return winner
  end

  def check_win_condition(array)
  counter = 0
  winner = ""
  # y_counter = 1
  array.each do
      if array[counter] == array[counter + 1] && array[counter] == array[counter + 2] && array[counter] == array[counter + 3] && array[counter] == 'X'
        winner = "X"
      end
      if array[counter] == array[counter + 1] && array[counter] == array[counter + 2] && array[counter] == array[counter + 3] && array[counter] == 'O'
        winner = "O"
      end
      counter += 1
    end
    return winner
  end

  # def hash_to_matrix
  #   big_array = []
  #   board.board_hash.keys.each do |key|
  #     big_array << board.board_hash[key]
  #   end
  #   return big_array
  #   # require 'pry'; binding.pry
  #
  # end
  #
  # def check_diagonal_2
  #   big_array = hash_to_matrix
  #
  #   #diagonal one way
  #   test_array_1 = [big_array[0][0], big_array[1][1], big_array[2][2], big_array[3][3], big_array[4][4], big_array[5][5]]
  #   test_array_2 = [big_array[0][1], big_array[1][2], big_array[2][3], big_array[3][4], big_array[4][5], big_array[5][6]]
  #   test_array_3 = [big_array[0][2], big_array[1][3], big_array[2][4], big_array[3][5], big_array[4][6], big_array[5][7]]
  #
  #   test_array_4 = [big_array[1][0], big_array[2][1], big_array[3][2], big_array[4][3], big_array[5][4], big_array[6][5]]
  #   test_array_5 = [big_array[1][1], big_array[2][2], big_array[3][3], big_array[4][4], big_array[5][5], big_array[6][6]]
  #   test_array_6 = [big_array[1][2], big_array[2][3], big_array[3][4], big_array[4][5], big_array[5][6], big_array[6][7]]
  #
  #   test_array_7 = [big_array[2][0], big_array[3][1], big_array[4][2], big_array[5][3], big_array[6][4]]
  #   test_array_8 = [big_array[2][1], big_array[3][2], big_array[4][3], big_array[5][4], big_array[6][5]]
  #   test_array_9 = [big_array[2][2], big_array[3][3], big_array[4][4], big_array[5][5], big_array[6][6]]
  #
  #   test_array_10 = [big_array[3][0], big_array[4][1], big_array[5][2], big_array[6][3]]
  #   test_array_11 = [big_array[3][1], big_array[4][2], big_array[5][3], big_array[6][4]]
  #   test_array_12 = [big_array[3][2], big_array[4][3], big_array[5][4], big_array[6][5]]
  #
  #   #diagonal the other way
  #   test_array_13 = [big_array[6][0], big_array[5][1], big_array[4][2], big_array[3][3], big_array[2][4], big_array[1][5]]
  #   test_array_14 = [big_array[6][1], big_array[5][2], big_array[4][3], big_array[3][4], big_array[2][5], big_array[1][6]]
  #   test_array_15 = [big_array[6][2], big_array[5][3], big_array[4][4], big_array[3][5], big_array[2][6], big_array[1][7]]
  #
  #   test_array_16 = [big_array[5][0], big_array[4][1], big_array[3][2], big_array[2][3], big_array[1][4], big_array[0][5]]
  #   test_array_17 = [big_array[5][1], big_array[4][2], big_array[3][3], big_array[2][4], big_array[1][5], big_array[0][6]]
  #   test_array_18 = [big_array[5][2], big_array[4][3], big_array[3][4], big_array[3][5], big_array[2][6], big_array[1][7]]
  #
  #   test_array_19 = [big_array[4][0], big_array[3][1], big_array[2][2], big_array[1][3], big_array[0][4]]
  #   test_array_20 = [big_array[4][1], big_array[3][2], big_array[2][3], big_array[1][4], big_array[0][5]]
  #   test_array_21 = [big_array[4][2], big_array[3][3], big_array[2][4], big_array[1][5], big_array[0][6]]
  #
  #   test_array_22 = [big_array[3][0], big_array[2][1], big_array[1][2], big_array[0][3]]
  #   test_array_23 = [big_array[3][1], big_array[2][2], big_array[1][3], big_array[0][4]]
  #   test_array_24 = [big_array[3][2], big_array[2][3], big_array[1][4], big_array[0][5]]
  #
  #   big_test_array = [test_array_1, test_array_2, test_array_3, test_array_4, test_array_5, test_array_6, test_array_7, test_array_8, test_array_9, test_array_10, test_array_11, test_array_12, test_array_13, test_array_14, test_array_15, test_array_16, test_array_17, test_array_18, test_array_19, test_array_20, test_array_21, test_array_22, test_array_23, test_array_24]
  #
  #
  #   winner_array = []
  #   # require 'pry'; binding.pry
  #   counter = 0
  #   big_test_array.each do
  #
  #     winner_array << check_win_condition(big_test_array[counter])
  #     counter +=1
  #
  #   end
  #
  #   if winner_array.include?("X")
  #     winner = "X"
  #   elsif winner_array.include?("O")
  #     winner = "O"
  #   else
  #     winner = ""
  #   end
  #
  #   # require 'pry'; binding.pry
  #   return winner
  #   #
  #
  #
  # end



  # def takes_turn
  #   player takes a turn, recieves input
  #     checks to make sure it is valid input
  #     if the column is full, let the player know that the column is full
  #       if the input is invalid (Q) for example, let the player know that we need a correct letter
  #     if it's good to go places the tile
  #   computer takes a turn (logic already built in to make sure that the list of available columns is only valid columns)
  #   checks winning conditions / end conditions
  #   print board
  #   says keep playing, or player 1 has won... or draw
  # end




end
