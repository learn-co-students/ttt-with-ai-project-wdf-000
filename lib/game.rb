class Game
  WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      [0,4,8],
                      [6,4,2]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1=nil,player_2=nil,board=nil)
    @player_1 = player_1
    @player_2 = player_2
    @board = board

    if @player_1 == nil
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    end
  end

  def current_player
    if @board.turn_count & 1 == 1
      @player_2
    else
      @player_1
    end
  end

  def over?
    !@board.cells.any?{|x| x == " "}
  end

  def won?
    if self.winner then true else false end
  end

  def draw?
    self.over? and !self.won?
  end

  def winner
    winner = WIN_COMBINATIONS.detect{|i| @board.cells[i[0]] + @board.cells[i[1]] + @board.cells[i[2]] == "XXX" || @board.cells[i[0]] + @board.cells[i[1]] + @board.cells[i[2]] == "OOO"}
    if winner then winner.first else nil end
  end

  def turn
    puts "\nPlease enter move: "
    move = self.current_player.move

    while !@board.valid_move?(move)
      puts "\nInvalid move, please enter a different one."
      move = self.current_player.move
    end
    
    @board.update(move,self.current_player)
  end

  def play
    
  end
end
