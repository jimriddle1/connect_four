require './lib/board'
require './lib/turn'
require './lib/game'
require 'rspec'

board = Board.new
turn = Turn.new(board)
game = Game.new

puts "-*-*-*-*-*-*-*-*-*-*-*-*"
puts "Welcome to CONNECT FOUR"
puts "*-*-*-*-*-*-*-*-*-*-*-*-"
puts "Enter p to play. Enter q to quit"

user_input = gets.chomp.upcase
game.play_game(user_input)
