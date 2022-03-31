require './lib/board'
require './lib/turn'
require 'rspec'

board = Board.new
turn = Turn.new(board)


puts "type your name"
user_input = gets.chomp
puts "your name is #{user_input}"

4.times do
  turn.takes_turn
end
