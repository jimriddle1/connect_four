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


end
