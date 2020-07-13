
require 'pry'
class Game
#    include Players
   attr_accessor :board, :player_1, :player_2
 # Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6],
 ]
 def initialize(player_1 = Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new) #all parameters are objects?

   @player_1 = player_1
   @player_2 = player_2
   @board = board

 end
 def current_player
   @board.turn_count.even? ? @player_1 : @player_2
 end

 def won?
   won = WIN_COMBINATIONS.any? do |array|
     @board.cells[array[0]] == "X" &&  @board.cells[array[1]] == "X" && @board.cells[array[2]] == "X"
   end
   if won
     true
   else
   won = WIN_COMBINATIONS.any? do |array|
     @board.cells[array[0]] == "O" &&  @board.cells[array[1]] == "O" && @board.cells[array[2]] == "O"
   end
    true
  end
  won
 end

 def draw?
   !won? && @board.full?
 end

 def over?
   @board.full? || won? || draw?
 end

 def winner
   if won?
     x_count = 0
     o_count = 0
     @board.cells.each do |cell|
       if cell == "X"
         x_count += 1
       elsif cell == "O"
         o_count += 1
       end
     end
     if x_count > o_count
       "X"
     else
       "O"
     end
   end
 end

 def turn
   input = current_player.move(@board)
   until @board.valid_move?(input)
     puts "Invalid input. Please choose between 1-9."
     input = current_player.move(@board)
   end
     @board.update(input, current_player)
 end

 def play
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
