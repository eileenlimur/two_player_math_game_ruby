require "./question"

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1 #what is getting stored in current_player? Seems like we are able to call @player1's instance methods on current_player
    @loser = ""
  end

  def start
    puts "Welcome to the mathematics death match. Loser gets a shortcut to the mathterlife."
    press_enter do
      while !self.end_game?
        one_round
      end
    end
    self.who_lost
    puts "#{@loser.name} lost. Await the sweet kiss of mathematical death."
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
    "#{@player1.name}: #{@player1.lives} vs #{@player2.name}: #{@player2.lives}"
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
    puts "#{@current_player.name} is up."

    press_enter do

      question = Question.new
      puts question.question
      answer = $stdin.gets.chomp

      if question.answer_check(answer.to_i)
        puts "Correct, #{@current_player.name}. You survive, for now. "
      else
        puts "NO! NO! NO! NO! NO! NO! The correct answer was #{question.answer} all along. "
        @current_player.lose_game
      end
      
      puts "Current score: " + self.score + "."
      press_enter do "" end
    end

    self.toggle_player
  end
end

