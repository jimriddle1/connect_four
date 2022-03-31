# require '.lib/board'
# require 'pry'
class Turn

attr_reader :board
  def initialize(board)
    @board = board
  end

  def takes_turn
    # binding.pry
    board.player_turn
    # binding.pry
    board.computer_turn
    # binding.pry
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

  def check_diagonal_right

  end

  def check_diagonal_left

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
