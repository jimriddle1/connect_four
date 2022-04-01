require './lib/board'
require './lib/turn'
require 'rspec'

board = Board.new
turn = Turn.new(board)

puts "Welcome to CONNECT FOUR"
puts "Enter p to play. Enter q to quit"

user_input = gets.chomp.upcase
# require 'pry'; binding.pry

if user_input == "Q"
  puts "Thanks for playing!"
elsif user_input == "P"
  # game_over? = false

  while turn.game_over == false
    turn.takes_turn
  end


  # if turn.takes_turn == false
  #   turn.takes_turn
  # else
  #   puts "Ending the game now, Thanks for playing!"
  # end
else
  puts "Invalid Input, please try again"
  # connect_four_runner.rb
end


# 4.times do
#   turn.takes_turn
# end
