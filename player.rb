class Player
  def initialize(name)
    @name = name
    @lives = 3
  end

  attr_reader :lives, :name

  def lose_game
    @lives -= 1
  end

  def lost
    @lives == 0
  end
end