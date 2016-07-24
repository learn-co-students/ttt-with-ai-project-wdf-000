class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.find do |x|
      x.all? {|index| board.cells[index] == "X"} || x.all? {|index| board.cells[index] == "O"}
    end
  end

  def draw?
    !self.won? && self.board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      self.board.cells[self.won?.first]
    else
      nil
    end
  end

  def turn
    position = current_player.move(board)
    if board.valid_move?(position)
      board.update(position, current_player)
    else
      turn
    end
  end

  def play
    @board.display
    until over?
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