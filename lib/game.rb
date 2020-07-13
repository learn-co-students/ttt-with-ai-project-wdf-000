class Game
  attr_accessor :board, :player_1, :player_2
  # shuffle the WIN_COMBINATIONS, then make a random selection from any of the winning combinations on the first turn. Exclude combinations if the opponent has taken one of the spots. Make future decisions based on possible combinations remaining. 
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board 
  end
  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end
  def draw?
    !@board.cells.include?(" ") && !won? 
  end
  def over?
    draw? || won?
  end
  def turn  
    choice = current_player.move(@board)
    if @board.valid_move?(choice)
      @board.update(choice, current_player)
    else
      puts "Space is taken or not on the board. Select Again:"
      turn
    end
    puts "\n\n"
    @board.display 
    puts "\n#{'_'*15}\n"
  end
  def won? 
    WIN_COMBINATIONS.detect do |combo| 
      @board.cells[combo[0]] != " " &&
      @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] 
    end  
  end
  def winner 
    @board.cells[won?[0]] if won?
  end
  def play
    until over?
      puts "\n\n"
      turn
    end 
    if won?
      puts "Congratulations #{winner}!" if won? 	
    elsif draw?
      puts "Cats Game!"
    end  
  end
end
