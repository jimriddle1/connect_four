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

  it "checks to make sure a piece has been added" do
    board = Board.new
    # require 'pry'; binding.pry

    expect(board.board_hash[:A].count(".")).to eq(6)
    expect(board.board_hash[:A].count("X")).to eq(0)

    # require 'pry'; binding.pry

    board.add_piece(:A,"X")

    expect(board.board_hash[:A].count(".")).to eq(5)
    expect(board.board_hash[:A].count("X")).to eq(1)
    expect(board.board_hash[:A][5]).to eq("X")

    board.add_piece(:A,"O")
    # require 'pry'; binding.pry

    expect(board.board_hash[:A].count(".")).to eq(4)
    expect(board.board_hash[:A].count("X")).to eq(1)
    expect(board.board_hash[:A].count("O")).to eq(1)
    expect(board.board_hash[:A][5]).to eq("X")
    expect(board.board_hash[:A][4]).to eq("O")

    # require 'pry'; binding.pry
  end

  it "checks to see a valid_input" do
    board = Board.new
    # board.is_valid_input?(:B)
    # require 'pry'; binding.pry
    expect(board.is_valid_input?(:A)).to eq (true)

    6.times do
      board.add_piece(:A, "X")
    end
    expect(board.is_valid_input?(:A)).to eq (false)

    # require 'pry'; binding.pry
  end

  xit "gets user input" do
    board = Board.new
    user_input = board.get_user_input
    expect(user_input).to eq(:A)
  end

  it "has the player take a turn" do
    board = Board.new
    board.player_turn
    require 'pry'; binding.pry
    expect(board.board_hash).to eq({A: [".",".",".",".",".","X",],
                   B: [".",".",".",".",".",".",],
                   C: [".",".",".",".",".",".",],
                   D: [".",".",".",".",".",".",],
                   E: [".",".",".",".",".",".",],
                   F: [".",".",".",".",".",".",],
                   G: [".",".",".",".",".",".",]
                  })
  end


end
