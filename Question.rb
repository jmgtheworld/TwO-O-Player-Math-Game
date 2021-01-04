class Question

  attr_accessor :num1, :num2

  def initialize()
    @num1 = rand(1...20)
    @num2 = rand(1...20)
  end
  
  def sayQuestion()
    puts ": What does #{@num1} plus #{@num2} equal?"
    print "> "
  end

end


