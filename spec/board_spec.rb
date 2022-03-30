require 'rspec'
require './lib/board'

RSpec.describe Board do


  it "exists" do
    board = Board.new
    expect(board).to be_an_instance_of(Board)
  end

  it "has readable attributes" do
    board = Board.new
    # require 'pry'; binding.pry
    expect(board.board_hash).to eq({A: [".",".",".",".",".",".",],
                   B: [".",".",".",".",".",".",],
                   C: [".",".",".",".",".",".",],
                   D: [".",".",".",".",".",".",],
                   E: [".",".",".",".",".",".",],
                   F: [".",".",".",".",".",".",],
                   G: [".",".",".",".",".",".",]
                  })
  end

  xit "prints the board" do
    board = Board.new
    require 'pry'; binding.pry
  end

  it "checks if column is available" do
    board = Board.new
    expect(board.is_column_full?('B')).to eq(true)
  end

  it "checks if column is unavailable" do
    board = Board.new
    board.board_hash[:B] = ['X','X','X','X','X','X']
    expect(board.is_column_full?('B')).to eq(false)
  end


end
