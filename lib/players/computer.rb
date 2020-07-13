require 'pry'

module Players

class Computer < Player

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def first_available_move(board)
     empty_indices = []
       board.cells.each_with_index { |el, i| empty_indices << i if el == " " }
    empty_indices.map{ |i| (i.to_i + 1).to_s }[0]
   end

 def move(board)
   if board.turn_count == 0
     "1"
   elsif board.cells[4] == " "
     "5"
   elsif !definite_move(board).nil?
     definite_move(board)
   elsif !block_move(board).nil?
     block_move(board)
   elsif !win_move(board).nil?
     win_move(board)
   else
     first_available_move(board)
   end
 end

  def definite_move(board)
   #  found = 0
    WIN_COMBINATIONS.each do |combo|
      if (board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token) && board.cells[combo[2]] == " "
       #  found = 1
        return (combo[2] + 1).to_s
      elsif (board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token) && board.cells[combo[1]] == " "
       #  found = 1
        return (combo[1] + 1).to_s
      elsif (board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token) && board.cells[combo[0]] == " "
       #  found = 1
        return (combo[0] + 1).to_s
      end
    end
     return nil
     # if found == 0
  end

  def win_move(board)
   # self.token = computer's token
   found = 0
   corners = [0,2,6,8]
     WIN_COMBINATIONS.each do |combo|
       if  (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") || (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") || (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ")
     #if true, there is the other players token in the combo, move onward
     elsif board.cells[combo[0]] == " " && corners.include?(combo[0])
         found = 1
         return (combo[0]+1).to_s
       elsif board.cells[combo[1]] == " " && corners.include?(combo[1])
         found = 1
         return (combo[1]+1).to_s
       elsif board.cells[combo[2]] == " " && corners.include?(combo[2])
         found = 1
         return (combo[2]+1).to_s
       elsif board.cells[combo[0]] == " "
         found = 1
         return (combo[0]+1).to_s
       elsif board.cells[combo[1]] == " "
         found = 1
         return (combo[1]+1).to_s
       elsif board.cells[combo[2]] == " "
         found = 1
         return (combo[2]+1).to_s
       end
     end
     return nil if found == 0
   end

   def block_move(board)
     #  found = 0
     WIN_COMBINATIONS.each do |combo|
       if (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") && (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && board.cells[combo[2]] == " "
         # found = 1
         return (combo[2] + 1).to_s
       elsif (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") && (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.cells[combo[1]] == " "
         # found = 1
         return (combo[1] + 1).to_s
       elsif (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && board.cells[combo[0]] == " "
         # found = 1
         return (combo[0] + 1).to_s
       end
     end
     return nil
     # if found == 0
   end

 end
end
