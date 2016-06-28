class Game
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,5,8],
    [6,4,2]
  ]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=nil, player_2=nil, board=nil)
    @board = board || Board.new
    @player_1 = player_1 || Players::Human.new("X")
    @player_2 = player_2 || Players::Human.new("O")
  end

  def current_player
    self.board.turn_count % 2 == 0 || self.board.cells.count == 0 ? player_1 : player_2
  end

  def over?
    self.board.full? || self.won? || self.draw?
  end

  def draw?
    self.board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect { |comb|
      comb.all? { |i| self.board.cells[i] == "X" } || comb.all? { |i| self.board.cells[i] == "O" }
      # comb.all? { |i| self.board.cells[i] == current_player.token }
    }
  end

  def winner
    won? ? self.board.cells[won?[0]] : nil
  end

  def turn
    puts "Please choose a position between 1 - 9: "
    position = self.current_player.move(self.board)

    if self.board.valid_move?(position)
      self.board.update(position, self.current_player)
      self.board.display
    else
      self.turn  
    end
  end

  def play
    until self.over?
      self.turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end
