
class Game

attr_accessor :board, :player_1, :player_2, :token

WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 4, 8],
[2, 4, 6],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8]
]

def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @board = board
  @player_1 = player_1
  @player_2 = player_2
end

def current_player
  @board.turn_count.even? ? token = "X" : token = "O"
  [@player_1, @player_2].detect{|player| player.token == token}
end

def detect_indexes(letter)
  @board.cells.each_index.select{|index| @board.cells[index] == letter}
end

def won?
  xes = detect_indexes("X")
  os = detect_indexes("O")
  WIN_COMBINATIONS.detect {
  |win_combo| (win_combo - xes).empty? || (win_combo - os).empty?}
end

def winner
  xes = detect_indexes("X")
  os = detect_indexes("O")
  if xes == won?
    return "X"
  elsif os == won?
    return "O"
  end
end

def full?
  empties = @board.cells.select{|position| position == " " || position == ""}
  empties == []
end

def draw?
  !won? && full?
end

def over?
  full? || draw? || won?
end

def turn
    current_move = self.current_player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, self.current_player)
    else
      puts "Invalid move. Please try again."
      turn
    end
end

def play
  while !(self.over?)
    @board.display
    turn
  end
  @board.display
  declare_finish
end

def declare_finish
  if self.draw?
    puts "Cats Game!"
  elsif self.winner == "O"
   puts "Congratulations O!"
 else self.winner == "X"
    puts "Congratulations X!"
  end
end



end
