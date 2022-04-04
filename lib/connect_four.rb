 require './lib/board'
 require './lib/turn'
 require './lib/game'

game = Game.new
game.play_game(game.get_user_input)
