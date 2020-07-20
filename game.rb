require "./question"

class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @end_game = @player1.lost || @player2.lost
  end

  def start
    print "Welcome to the mathematics death match. Loser dies. Press enter."    
    input = $stdin.gets.chomp
    if input == ""
      print "Ready Player one. Press enter."
      input2 = $stdin.gets.chomp
      if input2 == ""
        question = Question.new
        puts question.question
      end
    end

  end

  private

  def one_round
    
end

