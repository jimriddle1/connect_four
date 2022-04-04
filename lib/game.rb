class Game
  attr_reader :turn

  def initialize
     @turn = Turn.new(Board.new)
     print_game_header
  end

  def print_game_header
    connect_four_emoji
    puts "Welcome to CONNECT FOUR!"
    connect_four_emoji2
    puts "Enter 'p' to play. Enter 'q' to quit:"
  end

  def get_user_input
    input = gets.chomp.upcase
  end

  def connect_four_emoji
    6.times do
      print "\u{1F7E1}"
      print "\u{1F534}"
    end
    puts ""
  end

  def connect_four_emoji2
    6.times do
      print "\u{1F534}"
      print "\u{1F7E1}"
    end
    puts ""
  end

  def play_game(input)
    if input == 'Q'
      puts "Thanks for playing!"
    elsif input == 'P'
      @turn.board.print_board
      while @turn.game_over == false
        @turn.takes_turn
      end
      puts "Game is over! Enter 'p' to play again or 'q' to quit:"
      @turn = Turn.new(board = Board.new)
      play_game(get_user_input)
    else
      puts "Invalid input, please try again."
      puts "Enter p to play. Enter q to quit:"
      play_game(get_user_input)
    end
  end
end
