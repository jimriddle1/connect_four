require './lib/board'
require './lib/turn'
require 'rspec'
RSpec.describe Turn do
  it "exists" do
    turn = Turn.new
    expect(turn).to be_an_instance_of(Turn)
  end
end
