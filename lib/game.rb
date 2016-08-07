require 'colorize'
class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
                      [0, 1, 2],
                      [3, 4, 5], 
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]
                    ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1 
    @player_2 = player_2 
    @board = board
  end

  def current_player
    if(board.turn_count.even?)
      player_1
    else
      player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_index1 = win_combo[0]
      win_index2 = win_combo[1]
      win_index3 = win_combo[2]

      pos1 = board.cells[win_index1]
      pos2 = board.cells[win_index2]
      pos3 = board.cells[win_index3]

      (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
    end
  end

  def over?
    won? || draw?
  end

  def draw?
    !won? && board.full?
  end

  def winner
    if won?
      board.cells[won?[0]]
    else
      nil
    end
  end

  def turn
    mv = current_player.move(board)
    if(board.valid_move?(mv))
      board.update(mv, current_player)
    else
      turn
    end
  end

  def play
    until over?
      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:cyan)
      if(current_player.token == "X")
        puts "              #{current_player.token}'s TURN".colorize(:light_red)
      else
        puts "              #{current_player.token}'s TURN".colorize(:light_green)
      end

      puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:cyan)
      turn
      puts "\n"
      board.display
      puts "\n"
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

  def start
    puts "----------------------------------".colorize(:cyan)
    puts "    Welcome to Tic-Tac-Toe!".colorize(:yellow)
    puts "----------------------------------".colorize(:cyan)

    puts "\tChoose a mode:".colorize(:light_yellow)
    puts "\n    0 - Computer V Computer".colorize(:light_yellow)
    puts "    1 - Player V Computer".colorize(:light_yellow)
    puts "    2 - Player V Player".colorize(:light_yellow)
    puts "    Exit".colorize(:light_yellow)
    puts "----------------------------------".colorize(:cyan)

    mode = gets.strip

    if(mode == "0")
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play

    elsif(mode == "1")
      puts "Who plays first? P or C".colorize(:green)
      input = gets.strip
      if(input == "P" || input == "p")
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
      else
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
      end
      start

    elsif(mode == "2")
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
      start
    end

  end

end


