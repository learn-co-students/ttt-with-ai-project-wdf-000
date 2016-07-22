require 'pry'
class Game
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

  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
    @board = board || Board.new
    # @player_1.board = @board
    # @player_2.board = @board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    !!win_combo
  end

  def draw?
    @board.full? && !won?
  end

  def winner
    win_combo ? @board.cells[win_combo[0]] : nil
  end

  def win_combo
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] != " " && @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]]
    end
  end

  def turn
    input = current_player.move(board)
    @board.valid_move?(input) ? @board.update(input, current_player) : turn
  end

  def play
    puts "Welcome to the Best TictacToe Ever!"
    @board.display
    until over?
      puts "#{current_player.token}'s turn"
      turn
      @board.display
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end 
  end

end

# game = Game.new
# game.play