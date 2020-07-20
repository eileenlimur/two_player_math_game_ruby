require "./player"
require "./game"
require "./question"

require "pp"

eileen = Player.new("Eileen")
jessica = Player.new("Jessica")

game = Game.new(eileen, jessica)
game.start