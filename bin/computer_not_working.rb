
# 1. try to get winning combination
# they'll have to switch winning combinations if any element has the other players token in it
#

# 2. try to block winning combination for other

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

  # def move(board)
  #   empty_indices = []
  #   board.cells.each_with_index { |el, i| empty_indices << i if el == " " }
  #   empty_indices.map{ |i| (i.to_i + 1).to_s }[0]
  # end

  def move(board)
    block_move(board)
    # block_move(board).nil? ? win_move(board) : block_move(board)


    # if block_move(board) == nil
    #   win_move(board)
    # else
    #   block_move(board)
    # end
  end


      def win_move(board)
       # self.token = computer's token

        WIN_COMBINATIONS.each do |combo|
               if (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") ||  (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") || (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ")
               elsif board.cells[combo[0]] != self.token
                 return (combo[0] + 1).to_s
               elsif board.cells[combo[1]] != self.token
                return (combo[1] + 1).to_s
              elsif board.cells[combo[2]] != self.token
                return (combo[2] + 1).to_s
              end

            end
      end


      def block_move(board)
       # self.token = computer's token
        WIN_COMBINATIONS.each do |combo|
               if (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") &&  (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") && board.cells[combo[2]] == " "
                 return (combo[2] + 1).to_s
               elsif (board.cells[combo[0]] != self.token && board.cells[combo[0]] != " ") &&  (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.cells[combo[1]] == " "
                 return (combo[1] + 1).to_s
               elsif (board.cells[combo[1]] != self.token && board.cells[combo[1]] != " ") &&  (board.cells[combo[2]] != self.token && board.cells[combo[2]] != " ") && board.cells[combo[0]] == " "
                 return (combo[0] + 1).to_s
               end
             end


          win_move(board)
      end


  end
end

# #  move to board.cells[combo[2]] (if good move logic follows)
 # move to board.cells[combo[2]] (if good move logic follows)
#  if none of the above have "O" in them or not empty: " "
#    then put X in  board.cells[combo[2]]
#  end
