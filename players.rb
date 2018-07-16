class Players

  attr_accessor(:name, :lives, :points)

  def initialize(name)
    @name = name
    @lives = 3
    @points = 0
  end

  def correct
    @points += 1
  end

  def incorrect
    @lives -= 1
  end

end
