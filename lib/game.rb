require 'pry'

class Game
  attr_accessor :board, :player_2, :player_1


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    board.display
     puts "\n"
  end




  WIN_COMBINATIONS = [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]

 def current_player
   board.cells.count(" ").odd? ? player_1 : player_2
 end

 def over?
    board.full? || won? || draw?
 end

 def won?
   WIN_COMBINATIONS.each do |combo_array|
     if board.cells[combo_array[0]] == "X" && board.cells[combo_array[1]] == "X" && board.cells[combo_array[2]] == "X"
       return combo_array
     end
     if board.cells[combo_array[0]] == "O" && board.cells[combo_array[1]] == "O" && board.cells[combo_array[2]] == "O"
       return combo_array
     end

   end
   return false
 end

  def draw?
    if board.full? && !won?
      true
    else
      false
    end
  end

  def winner
    if won?
      board.cells[self.won?[0]]
    end

  end

  def turn

     if board.turn_count%2 == 0
      #  @player_1.move(@board)
       m = player_1.move(board.cells)
       board.update(m, player_1)
       board.display
        puts "\n"

     else
      #  @player_2.move(@board)
       m = player_2.move(board.cells)
       board.update(m, player_2)
       board.display
       puts "\n"
     end
# binding.pry

end

 def play



  while !over?
    turn

  end

 if won?
  puts "Congratulations #{winner}!"
  end

  if draw?
   puts "Cats Game!"
  end

 end



end
