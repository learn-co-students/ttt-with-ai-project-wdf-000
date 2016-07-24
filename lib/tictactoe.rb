class TicTacToe
  attr_reader :game

  def initialize
    startup
    game.play
  end

  def startup
    puts "Welcome to Tic Tac Toe!"
    puts "How many players do you have? Please enter a number between 0 and 2:"
    input = gets.strip
    if input.to_i == 0
      @game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    elsif
      input.to_i == 1
      puts "Would you like to go first? Y / N"
      input = gets.strip
      if input == "Y" || input == "yes" || input == "y"
        @game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      else
        @game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      end
    elsif
      input.to_i == 2
      @game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
    else
      startup
    end
  end 

end