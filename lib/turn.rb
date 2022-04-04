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
    check_winner(winner_array)
    # if winner_array.include?("X")
    #   winner = "X"
    # elsif winner_array.include?("O")
    #   winner = "O"
    # else
    #   winner = ""
    # end
    # return winner
  end

  def check_winner(winner_array)
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

  def check_diagonal(number)
    winner_array = []
    winner = ""
    if number == 1
      custom_key_array = [0, 0, 0, 1, 2, 3]
    else
      custom_key_array = [6, 6, 6, 5, 4, 3]
    end
    starting_index_array = [2, 1, 0, 0, 0, 0]
    length_array = [4, 5, 6, 6, 5, 4]
      6.times do
        check_array = []
        index_counter = starting_index_array[0]
        key_counter = custom_key_array[0]

        length_array[0].times do

          check_array << (board.board_hash[board.board_hash.keys[key_counter]][index_counter])
          index_counter += 1
          key_counter += number

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






end
