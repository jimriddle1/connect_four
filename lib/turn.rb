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

  end

  def check_vertical
    # binding.pry
    board.board_hash.keys.each do

    end

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
