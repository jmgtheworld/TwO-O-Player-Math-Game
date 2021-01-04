require './Question'
require './Player'

class Game 

  def initialize      
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @currentPlayer = @p1
    @game = true
  end

  def correct
    puts "YES! You are correct."
  end

  def wrong 
    puts "Seriously? No!"
    @currentPlayer.life -= 1
    puts "P1: #{@p1.life}/3 vs P2: #{@p2.life}/3"
    
    if @currentPlayer.life == 0
      if @p1.life == 0
        puts "#{@p2.name} wins with a score of #{@p2.life}/3"
      else
        puts "#{@p1.name} wins with a score of #{@p1.life}/3"
      end
      @game = false
    end
  end
  
  def play
    while @game
      puts "---- NEW TURN ----"
      question = Question.new
      print @currentPlayer.name 
      question.sayQuestion()
      answer = gets.chomp.to_i
      puts answer
      puts question.num1 + question.num2

      if answer == (question.num1 + question.num2)
        correct
      else 
        wrong
      end

      if @currentPlayer.name == @p1.name
        @currentPlayer = @p2
      else
        @currentPlayer = @p1
      end


    end

    puts "---- GAME OVER ----"
    puts "Good bye!"
  end

end

game = Game.new
game.play
