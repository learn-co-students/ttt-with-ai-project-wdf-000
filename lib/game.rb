class Game

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]  
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count % 2 == 0 || board.cells.count == 0 ? player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |c| 
      @board.cells[c[0]] == @board.cells[c[1]] && 
      @board.cells[c[1]] == @board.cells[c[2]] && 
      @board.taken?(c[0]+1)
    end
  end

  def draw?
    !won? && @board.full?
  end

  def winner
    return nil unless won?
    @board.cells.count {|cell| cell == player_1.token} > @board.cells.count {|cell| cell == player_2.token} ? player_1.token : player_2.token
  end

  def turn
    move = current_player.move(@board)
    if !@board.valid_move?(move)
      puts "invalid"
      turn
    else
      @board.update(move, current_player)
      puts "It's #{current_player.token}'s turn"
      @board.display
    end
  end

  def play
    while !over?
      puts "It's #{current_player.token}'s turn"
      puts "where from 1 to 9 would you like to put your token?"
      turn
    end
    if draw?
      puts "Cats Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end