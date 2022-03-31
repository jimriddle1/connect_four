require './lib/board'
require './lib/turn'
require 'rspec'

RSpec.describe Turn do
  it "exists" do
    board = Board.new
    turn = Turn.new(board)
    expect(turn).to be_an_instance_of(Turn)
  end

  xit "can take a turn" do
    board = Board.new
    turn = Turn.new(board)
    binding.pry
    turn.takes_turn
    binding.pry
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
end
