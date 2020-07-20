require "./question"

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @end_game = @player1.lost || @player2.lost
  end

  def start
    print "Welcome to the mathematics death match. Loser gets a shortcut to the mathterlife. Press enter."    
    input = $stdin.gets.chomp
    if input
      while !@end_game
        one_round
      end
    end
  end

  protected

  def score
    ""
  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else 
      @current_player = @player1
    end
  end

  def one_round
    if @current_player == @player1
      print "#{@player1.name} is up. Press enter."
      # @current_player = @player2
    else
      print "#{@player2.name} is up. Press enter."
      # @current_player = @player1
    end

    input = $stdin.gets.chomp
    
    if input
      question = Question.new
      puts question.question
      answer = $stdin.gets.chomp
      if question.answer_check(answer.to_i)
        puts "Correct, #{@current_player.name}. You survive, for now. Press enter."
      else
        puts "NO!!!!!!!!!! NO!!! NO! NO! NO! NO! The correct answer was #{question.answer} all along."
      end
      puts self.score
    end

    self.toggle_player

  end
end

