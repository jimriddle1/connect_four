require 'rspec'
require './lib/board'
require './lib/turn'
require './lib/game'

RSpec.describe Game do
  it "exists" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it "has readable attributes" do
    board1 = Board.new
    turn = Turn.new(board1)
    game = Game.new
    expect(game.turn.board.find_valid_columns).to eq(board1.find_valid_columns)
  end

end
