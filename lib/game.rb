class Game
  attr_reader :game_over

  def initialize
     @game_over = false
     @board = Board.new
     @turn = Turn.new(@board)

  end

  # puts "-*-*-*-*-*-*-*-*-*-*-*-*"
  # puts "Welcome to CONNECT FOUR"
  # puts "*-*-*-*-*-*-*-*-*-*-*-*-"
  # puts "Enter p to play. Enter q to quit"

  def play_game(input)
    #binding.pry
    if input == 'Q'
      puts "Thanks for playing!"
    elsif input == 'P'
      while @turn.game_over == false
        @turn.takes_turn
      end
      puts "Enter 'P' to play again or 'Q' to quit:"
      user_input1 = gets.chomp.upcase
      @turn = Turn.new(board = Board.new)
      #@turn.game_over = true
      play_game(user_input1)
    else
      puts "Invalid Input, please try again:"
      user_input2 = gets.chomp.upcase
      play_game(user_input2)
    end



  end



end
