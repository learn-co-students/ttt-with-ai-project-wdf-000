require 'pry'
class Game
  extend Players
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    check = []
    WIN_COMBINATIONS.each do |combination|
      combination.each do |index|
        check << board.cells[index]
      end
      if check.uniq.count == 1 && check.uniq.first != " "
        return check.uniq.first
      else
        check.clear
        false
      end
    end
    false
  end

  def over?
    won? || draw?
  end

  def draw?
    !won? && board.full?
  end

  def winner
    won?.class == String ? won? : nil
  end

  def turn
    puts "Make your move player #{current_player.token}"
    move = current_player.move(board)
    if board.valid_move?(move)
      board.update(move, current_player.token)
    else
      puts "Something went wrong, try again"
      turn
    end
  end

  def play
    puts "Welcome to Tic Tac Toe Game"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end