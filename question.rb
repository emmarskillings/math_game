class Question

  attr_reader(:answer)

  def initialize
    @a = rand(1..10)
    @b = rand(1..10)
    @operation = rand(1..3)

    case @operation
    when 1
      @answer = @a + @b
      @operator = 'plus'
    when 2
      @answer = @a - @b
      @operator = 'minus'
    when 3
      @answer = @a * @b
      @operator = 'times'
    end
  end

  def question_to_string
    "What is #{@a} #{@operator} #{@b}? "
  end

  def answer_is_correct?(input)
    if input == @answer
      return true
    else
      return false
    end
  end

end
