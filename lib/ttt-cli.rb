class CLI

  def run
    puts "Welcome to Tic Tac Toe!"
    puts "How many players are playing 0, 1, or 2?"
    number_of_players = gets.chomp

    case number_of_players.to_i

    when 0


       game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
       game.play


    when 1
      if go_first == 1
       Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
      else
       Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
     end

    when 2

       Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    else
      while !(0..2).include?(number_of_players)
        run
      end
    end

  end




  def go_first
    puts "Who goes first? You or Computer Enter Y/N "
    first_player = gets.chomp

  end

end
