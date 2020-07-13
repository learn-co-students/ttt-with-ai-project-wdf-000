class TicTacToe
  protected
  attr_reader :game

  def initialize
    setup
    game.play
    play_again
  end

  def setup
    puts "Welcome to Tic Tac Toe!"
    players = player_number

    if players == 0
      @game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    elsif players == 1
      @game = human_vs_computer
    elsif players == 2
      @game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
    end
    game.board.display
  end

  def player_number
    input = ""
    until (0..2).include?(input)
      puts "How many players do you have?"
      input = gets.chomp.to_i
      puts "Invalid number of players. Please try again." unless (0..2).include?(input)
    end
    input
  end

  def human_vs_computer
    answer = ""
    until answer.include?("yes") || answer.include?("no")
      puts "Would you like to go first?"
      answer = gets.chomp.downcase
      puts "Invalid answer." unless answer.include?("yes") || answer.include?("no")
    end

    if answer.include?("yes")
      Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    elsif answer.include?("no")
      Game.new(Players::Computer.new("X"), Players::Human.new("O"))
    end
  end

  def play_again
    play_again = ""
    until play_again.include?("yes") || play_again.include?("no")
      puts "Would you like to play again?"
      play_again = gets.chomp.downcase
      puts "Invalid answer. Please enter 'yes' or 'no'." unless play_again.include?("yes") || play_again.include?("no")
    end
    TicTacToe.new if play_again.include?("yes")
  end
end
