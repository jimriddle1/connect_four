require 'socket'
require './lib/board'
require './lib/turn'
require 'rspec'


starter_input = nil
column_guess = nil

board = Board.new
turn = Turn.new(board)

puts "Welcome to CONNECT FOUR"
puts "Enter p to play. Enter q to quit"

user_input = gets.chomp.upcase

if user_input == "Q"
  puts "Thanks for playing!"
elsif user_input == "P"


  while turn.game_over == false
    turn.takes_turn
  end



else
  puts "Invalid Input, please try again"
  # connect_four_runner.rb
end

server = TCPServer.new(8181)

loop do
  puts 'Waiting for Request...'
  connection = server.accept

  puts "Got this Request:"
  request_lines = []
  line = connection.gets.chomp
  while !line.empty?
    request_lines << line
    line = connection.gets.chomp
  end

  puts request_lines

  request_line = request_lines[0]
  if request_line.include? '?'
    path = request_line.split[1]
    params = path.split("guess=")
    guess = params[-1].to_i
  end

  puts "Sending response."
  if guess < answer
    output = "<html>Your Guess of #{guess} was too low</html>"
  elsif guess > answer
    output = "<html>Your Guess of #{guess} was too high</html>"
  else
    output = "<html>Your Guess of #{guess} was Correct!</html>"
  end
  status = "http/1.1 200 ok"
  response = status + "\r\n" + "\r\n" + output



  connection.puts response

  connection.close
end

# puts "Sending response."
# output = "<html>Hello from the Server side!</html>"
# status = "http/1.1 200 ok"
# response = status + "\r\n" + "\r\n" + output
