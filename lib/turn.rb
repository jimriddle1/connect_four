class Turn

attr_reader :board, :game_over
  def initialize(board)
    @game_over = false
    @board = board
  end

  def takes_turn
    board.player_turn
    if board.board_full == true
      puts ""
      draw_emoji
      puts "Board full! DRAW!"
      draw_emoji
      @game_over = true
    end
    if (check_horizontal == "X" || check_vertical == "X" ||
       check_diagonal(1) == "X" || check_diagonal(-1) == "X")
      puts ""
      firework_emoji
      puts "Congrats! The player has won the game!"
      firework_emoji
      @game_over = true
    end
    if @game_over == false
      board.computer_turn
      if (check_horizontal == "O" || check_vertical == "O" ||
         check_diagonal(1) == "O" || check_diagonal(-1) == "O")
        puts ""
        alarm_emoji
        puts "MACHINE TAKEOVER IMMINENT!"
        alarm_emoji
        @game_over = true
      end
    end
  end

  def firework_emoji
    19.times do
      print "\u{1F386}"
    end
    puts ""
  end

  def alarm_emoji
    13.times do
      print "\u{1F6A8}"
    end
    puts ""
  end

  def draw_emoji
    16.times do
      print "✏️"
    end
    puts ""
  end

  def check_horizontal
    winner_array = []
    index_counter = 0
    7.times do |index|
      check_array = []
      board.board_hash.keys.each do |key|
        check_array << (board.board_hash[key][index])
      end
      #index_counter += 1
      winner_array << check_win_condition(check_array)
    end
    check_winner(winner_array)
  end

  def check_diagonal(number)
    winner_array = []
    if number == 1
      custom_key_array = [0, 0, 0, 1, 2, 3]
    else
      custom_key_array = [6, 6, 6, 5, 4, 3]
    end
    starting_index_array = [2, 1, 0, 0, 0, 0]
    length_array = [4, 5, 6, 6, 5, 4]
      6.times do
        check_array = []
        index_counter = starting_index_array[0]
        key_counter = custom_key_array[0]

        length_array[0].times do
          check_array << (board.board_hash[board.board_hash.keys[key_counter]][index_counter])
          index_counter += 1
          key_counter += number
        end
        winner_array << check_win_condition(check_array)
        custom_key_array.shift
        starting_index_array.shift
        length_array.shift
      end
    check_winner(winner_array)
  end

  def check_vertical
    winner_array = []
    board.board_hash.keys.each do |key|
      winner_array << check_win_condition(board.board_hash[key])
    end
    check_winner(winner_array)
  end

  def check_winner(winner_array)
    if winner_array.include?("X")
      winner = "X"
    elsif winner_array.include?("O")
      winner = "O"
    else
      winner = ""
    end
    return winner
  end

  def check_win_condition(array)
  counter = 0
  winner = ""
  array.each do
      if array[counter] == array[counter + 1] && array[counter] == array[counter + 2] && array[counter] == array[counter + 3] && array[counter] == 'X'
        winner = "X"
      end
      if array[counter] == array[counter + 1] && array[counter] == array[counter + 2] && array[counter] == array[counter + 3] && array[counter] == 'O'
        winner = "O"
      end
      counter += 1
    end
    return winner
  end
end
