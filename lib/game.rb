class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column
  [0,4,8],  # Diagonal left-right
  [2,4,6]  #Diagonal right-left
  ]
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O") , board = Board.new)
    @player_1 = player_1 if player_1
    @player_2 = player_2 if player_2
    @board = board if board
  end

  def current_player
    turn_count % 2 == 0 ? player_1 : player_2

  end

  # Turn_count
  def turn_count
    @board.cells.count{|token| token == "X" || token == "O"}
  end

  # Won method
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      # binding.pry
      position_1 = @board.cells[win_combination[0]] # load the value of the board at win_index_1
      position_2 = @board.cells[win_combination[1]] # load the value of the board at win_index_2
      position_3 = @board.cells[win_combination[2]] # load the value of the board at win_index_3

      if position_1 == " " || position_2 == " " || position_3 == " "
        false
      elsif position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return win_combination
      end
    end
    false
  end

  # Full method
  def full?
    @board.cells.all? do |position|
      position == "X" || position == "O"
    end
  end

  # Draw method
  def draw?
    !won? && full?     
  end

  def over?
    won? || full? || draw?

  end

  #Winner
  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  # Turn
  def turn
    
    player = current_player
    input = player.move(@board)

    if @board.valid_move?(input)
      @board.update(input, player)
      @board.display
    else
      turn
    end
  end

  def play
    until over? do
      turn
    end

    if won?
      puts "Congratulations #{winner}!"  
    elsif draw?
      puts "Cats Game!"
    end
  end

end
