class Game
  attr_reader :turn

  def initialize
     @turn = Turn.new(Board.new)
  end

  def play_game(input)
    if input == 'Q'
      puts "Thanks for playing!"
    elsif input == 'P'
      while @turn.game_over == false
        @turn.takes_turn
      end
      puts "Game is over! Enter 'P' to play again or 'Q' to quit:"
      user_input1 = gets.chomp.upcase
      @turn = Turn.new(board = Board.new)
      play_game(user_input1)
    else
      puts "Invalid Input, please try again:"
      puts "Enter p to play. Enter q to quit"
      user_input2 = gets.chomp.upcase
      play_game(user_input2)
    end
  end

end
