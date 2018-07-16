require './game.rb'
require './players.rb'
require './question.rb'
require './turn.rb'

@game_on = true
@turn = 0

puts "Welcome to MathimatiCOOL 😎"
puts

print "Player 1 name: "
username = gets.chomp
p1 = Players.new(username)
print "Player 2 name: "
username = gets.chomp
p2 = Players.new(username)

puts
puts "Let the games begin! 🗡"
puts

while @game_on

  question = Question.new

  case @turn
  when 0
    print "#{p1.name} "
  when 1
    print "#{p2.name} "
  end

  print question.question_to_string

  @input = gets.chomp.to_i

  if @turn === 0 && question.answer_is_correct?(@input)
    puts
    puts "CORRECT! You're smart 🤓"
    p1.correct
    @turn += 1
  elsif @turn === 0 && !question.answer_is_correct?(@input)
    puts
    puts "WRONG! Boo you 👎"
    p1.incorrect
    @turn += 1
  elsif @turn === 1 && question.answer_is_correct?(@input)
    puts
    puts "CORRECT! You're smart 🤓"
    p2.correct
    @turn -= 1
  elsif @turn === 1 && !question.answer_is_correct?(@input)
    puts
    puts "WRONG! Boo you 👎"
    p2.incorrect
    @turn -= 1
  end

  puts
  puts "Who's winning??"
  puts
  puts "#{p1.name}: ✅ #{p1.points} ❤️ #{p1.lives}/3 vs. #{p2.name}: ✅ #{p2.points}, ❤️ #{p2.lives}/3"
  puts
  puts "On to the next round!"
  puts
  puts "--------------------------"
  puts

  if p1.lives < 1 || p2.lives < 1
    puts "GAME OVER 💀"
    puts
    if p1.lives < 1
      puts "#{p2.name} is the smartest!"
      puts
      puts "Better luck next time, #{p1.name}!"
      puts
    elsif p2.lives < 1
      puts "#{p1.name} is the smartest!"
      puts
      puts "Better luck next time, #{p2.name}!"
      puts
    end

    puts "FINAL SCORE"
    puts
    puts "#{p1.name}: ✅ #{p1.points} vs. #{p2.name}: ✅ #{p2.points}"
    puts

    @game_on = false
  end

end
