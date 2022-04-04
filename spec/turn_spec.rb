require 'rspec'
require './lib/board'
require './lib/turn'

RSpec.describe Turn do
  it "exists" do
    board = Board.new
    turn = Turn.new(board)
    expect(turn).to be_an_instance_of(Turn)
  end

  xit "can take a turn" do
    board = Board.new
    turn = Turn.new(board)
    # binding.pry
    turn.takes_turn
    # binding.pry
    expect(turn.board.is_board_full?). to eq(false)
  end

  it "checks win condition_1" do
    board = Board.new
    board.board_hash[:A] = ['O','O','X','X','X','X']
    turn = Turn.new(board)
    expect(turn.check_win_condition(board.board_hash[:A])).to eq("X")
  end

  it "checks win condition_2" do
    board = Board.new
    board.board_hash[:A] = ['X','X','O','X','X','X']
    turn = Turn.new(board)
    expect(turn.check_win_condition(board.board_hash[:A])).to eq("")
  end

  it "checks win condition_3" do
    board = Board.new
    board.board_hash[:A] = ['X','O','O','O','O','X']
    turn = Turn.new(board)
    expect(turn.check_win_condition(board.board_hash[:A])).to eq("O")
  end

  it "checks vertical win condition" do
    board1 = Board.new
    board1.board_hash[:A] = ['X','X','X','X','X','X']
    turn = Turn.new(board1)
    expect(turn.check_vertical).to eq("X")

    board2 = Board.new
    board2.board_hash[:B] = ['X','X','O','X','X','X']
    turn = Turn.new(board2)
    expect(turn.check_vertical).to eq("")

    board3 = Board.new
    board3.board_hash[:A] = ['X','O','O','O','O','X']
    turn = Turn.new(board3)
    expect(turn.check_vertical).to eq("O")
  end

  it "checks horizontal win condition_1" do
    board1 = Board.new
    board1.board_hash[:A] = ['.','.','O','.','.','.']
    board1.board_hash[:B] = ['.','.','O','.','.','.']
    board1.board_hash[:C] = ['.','.','O','.','.','.']
    board1.board_hash[:D] = ['.','.','O','.','.','.']
    board1.board_hash[:E] = ['.','.','O','.','.','.']
    board1.board_hash[:F] = ['.','.','O','.','.','.']
    board1.board_hash[:G] = ['.','.','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_horizontal).to eq("O")
  end

  it "checks horizontal win condition_2" do
    board1 = Board.new
    board1.board_hash[:A] = ['.','.','O','.','.','.']
    board1.board_hash[:B] = ['.','.','O','.','.','.']
    board1.board_hash[:C] = ['.','.','O','.','.','.']
    board1.board_hash[:D] = ['.','.','X','.','.','.']
    board1.board_hash[:E] = ['.','.','O','.','.','.']
    board1.board_hash[:F] = ['.','.','O','.','.','.']
    board1.board_hash[:G] = ['.','.','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_horizontal).to eq("")
  end

  it "checks horizontal win condition_3" do
    board1 = Board.new
    board1.board_hash[:A] = ['X','.','O','.','.','.']
    board1.board_hash[:B] = ['X','.','O','.','.','.']
    board1.board_hash[:C] = ['X','.','X','.','.','.']
    board1.board_hash[:D] = ['X','.','X','.','.','.']
    board1.board_hash[:E] = ['.','.','X','.','.','.']
    board1.board_hash[:F] = ['.','.','O','.','.','.']
    board1.board_hash[:G] = ['.','.','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_horizontal).to eq("X")
  end

  xit "checks diag_down_right win condition_1" do
    board1 = Board.new
    board1.board_hash[:A] = ['01','02','03','04','05','06']
   board1.board_hash[:B] = ['07','08','09','10','11','12']
   board1.board_hash[:C] = ['13','14','15','16','17','18']
   board1.board_hash[:D] = ['19','20','21','22','23','24']
   board1.board_hash[:E] = ['25','26','27','28','29','30']
   board1.board_hash[:F] = ['31','32','33','34','35','36']
   board1.board_hash[:G] = ['37','38','39','40','41','42']
    turn = Turn.new(board1)
    expect(turn.check_diagonal_down_right).to eq("O")
  end

  xit "converts the hash to a matrix" do
    board1 = Board.new
    board1.board_hash[:A] = ['1','2','3','4','5','6']
    board1.board_hash[:B] = ['7','8','9','10','11','12']
    board1.board_hash[:C] = ['13','14','15','16','17','18']
    board1.board_hash[:D] = ['19','20','21','22','23','24']
    board1.board_hash[:E] = ['25','26','27','28','29','30']
    board1.board_hash[:F] = ['31','32','33','34','35','36']
    board1.board_hash[:G] = ['37','38','39','40','41','42']
    turn = Turn.new(board1)
    # turn.check_diagonal_2
    expect(turn.hash_to_matrix).to eq([["1", "2", "3", "4", "5", "6"],
                                 ["7", "8", "9", "10", "11", "12"],
                                 ["13", "14", "15", "16", "17", "18"],
                                 ["19", "20", "21", "22", "23", "24"],
                                 ["25", "26", "27", "28", "29", "30"],
                                 ["31", "32", "33", "34", "35", "36"],
                                 ["37", "38", "39", "40", "41", "42"]])
  end

  xit "checks diag left win condition the different way_1" do
    board1 = Board.new
    board1.board_hash[:A] = ['.','.','O','.','.','.']
    board1.board_hash[:B] = ['.','.','O','.','.','.']
    board1.board_hash[:C] = ['.','.','O','.','.','.']
    board1.board_hash[:D] = ['.','.','X','.','.','.']
    board1.board_hash[:E] = ['.','.','O','.','.','.']
    board1.board_hash[:F] = ['.','.','O','.','.','.']
    board1.board_hash[:G] = ['.','.','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_diagonal_2).to eq("")
  end

  xit "checks diag left win condition the different way_2" do
    board1 = Board.new
    board1.board_hash[:A] = ['X','.','O','.','.','.']
    board1.board_hash[:B] = ['.','X','O','.','.','.']
    board1.board_hash[:C] = ['.','.','X','.','.','.']
    board1.board_hash[:D] = ['.','.','X','X','.','.']
    board1.board_hash[:E] = ['.','.','O','.','.','.']
    board1.board_hash[:F] = ['.','.','O','.','.','.']
    board1.board_hash[:G] = ['.','.','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_diagonal_2).to eq("X")
  end

  xit "checks diag left win condition the different way_3" do
    board1 = Board.new
    board1.board_hash[:A] = ['X','.','O','.','.','.']
    board1.board_hash[:B] = ['.','O','O','.','.','.']
    board1.board_hash[:C] = ['.','.','X','.','.','.']
    board1.board_hash[:D] = ['.','.','X','X','O','.']
    board1.board_hash[:E] = ['.','.','O','O','.','.']
    board1.board_hash[:F] = ['.','.','O','.','.','.']
    board1.board_hash[:G] = ['.','O','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_diagonal_2).to eq("O")
  end

  xit "checks diag left win condition the different way_4" do
    board1 = Board.new
    board1.board_hash[:A] = ['X','.','O','.','X','.']
    board1.board_hash[:B] = ['.','O','O','X','.','.']
    board1.board_hash[:C] = ['.','.','X','.','.','.']
    board1.board_hash[:D] = ['.','X','X','X','O','.']
    board1.board_hash[:E] = ['.','.','O','O','.','.']
    board1.board_hash[:F] = ['.','.','X','.','.','.']
    board1.board_hash[:G] = ['.','O','O','.','.','.']
    turn = Turn.new(board1)
    expect(turn.check_diagonal_2).to eq("X")
  end

  it "checks diag_up_right win condition_11" do
    board1 = Board.new
    board1.board_hash[:A] = ['01','02','03','04','05','06']
   board1.board_hash[:B] = ['07','08','09','10','11','12']
   board1.board_hash[:C] = ['13','14','15','16','17','18']
   board1.board_hash[:D] = ['19','20','21','22','23','24']
   board1.board_hash[:E] = ['25','26','27','28','29','30']
   board1.board_hash[:F] = ['31','32','33','34','35','36']
   board1.board_hash[:G] = ['37','38','39','40','41','42']
   # board1.print_board
    turn = Turn.new(board1)
    expect(turn.check_diagonal_up_right).to eq("")
  end

end
