require 'pry'

def choose_start_order
  decision = nil
  until decision == "yes" || decision == "no"
    puts "Do you want to go first? Yes or No"
    decision = gets.chomp.downcase
    if decision.downcase == "yes"
      puts "You will go first, your token is X"
      return players = {
        :player1_token => "X",
        :player2_token => "O"
      }
    elsif decision.downcase == "no"
      puts "You will go second, your token is X"
      return players = {
        :player1_token => "O",
        :player2_token => "X"
      }
    end
  end
end

def computer_vs_computer
  Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
end

def computer_vs_player
  order = choose_start_order
  if order[:player1_token] != "X"
    player1 = Players::Computer.new(order[:player1_token])
    player2 = Players::Human.new(order[:player2_token])
  else
    player1 = Players::Human.new(order[:player1_token])
    player2 = Players::Computer.new(order[:player2_token])
  end
  Game.new(player1, player2, Board.new).play
end

def player_vs_player
  order = choose_start_order
  player1 = Players::Human.new(order[:player1_token])
  player2 = Players::Human.new(order[:player2_token])
  Game.new(player1, player2, Board.new).play
end