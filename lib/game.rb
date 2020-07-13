class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.odd? ? player_2 : player_1
  end

  def over?
    draw? || won?
  end

  def draw?
    board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |position| board.cells[position] == "X" } ||
      combo.all? { |position| board.cells[position] == "O" }
    end
  end

  def winner
    board.cells[won?.first] if won?
  end

  def turn
    player = current_player
    current_move = player.move(board.dup.freeze)

    unless board.valid_move?(current_move)
      puts "Invalid move. Please try again."
      turn
    else
      puts "Turn: #{board.turn_count + 1}"
      board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      puts
      board.display
      puts
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif
      puts "Cats Game!"
    end
  end
end
