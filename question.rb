class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    @question = "#{@num1} + #{@num2} = ?"
  end
  
  attr_reader :question

  def answer_check(given_answer)
    @answer == given_answer
  end
end