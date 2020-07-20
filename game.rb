class Game
  attr_accessor :player1, :player2, :current_player, :loser
  
  def initialize 
    @player1 = ""
    @player2 = ""
    @current_player = ""
    @loser = ""
    @round = 1
  end

  def start

    Signal.trap("INT") {
      puts "You quit. I guess that's fine too."
      exit
    }

    puts "Welcome to the mathematics death match. Loser gets a shortcut to the mathterlife."
    
    press_enter do
      set_players
    end
    
    puts "#{@player1.name} and #{@player2.name}, let's begin."

    press_enter do
      while !end_game?
        one_round
      end
    end
    
    who_lost

    puts "#{@loser.name} lost. Await the sweet kiss of mathematical death."
    puts "----- GAME OVER -----"

  end

  protected

  def press_enter
    print "Press Enter"
    input = $stdin.gets.chomp

    if input
      yield
    end

  end

  def score
    "Lives remaining - #{@player1.name}: #{@player1.lives}, #{@player2.name}: #{@player2.lives}"
  end

  def set_players
    puts "What is player 1's name?"
    print ">"
    p1 = $stdin.gets.chomp

    @player1 = Player.new(p1)

    puts "What is player 2's name?"
    print ">"
    p2 = $stdin.gets.chomp

    @player2 = Player.new(p2)

    self.current_player = @player1
  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def end_game?
    @player1.lost || @player2.lost
  end

  def who_lost
    @loser = @player1.lost ? @player1 : @player2
  end

  def one_round
    if @round != 1
      puts "----- NEW TURN ----"
    end

    puts "#{@current_player.name} is up."

    press_enter do

      question = Question.new
      puts question.question
      print ">"
      answer = $stdin.gets.chomp

      if question.answer_check(answer.to_i)
        puts "Correct, #{@current_player.name}. You survive, for now. "
      else
        puts "NO! NO! NO! NO! NO! NO! The correct answer was #{question.answer} all along. "
        @current_player.lose_game
      end
      
      puts self.score
      press_enter do "" end
    end

    self.toggle_player

    @round += 0.5

    Signal.trap("INT") {
      puts "You quit. I guess that's fine too."
      exit
    } # this seems to work sometimes but not always

  end
end

