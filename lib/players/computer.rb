module Players
  class Computer < Player
    attr_reader :move
    def move(board)

      cc = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

      choices = ["2", "4", "6", "8"]
      choices2 = ["1","3","5","7","9"]
      choice2 = choices2.sample
      choice = choices.sample
      # choice2.next
      # choice
      # while (board.valid_move?(choice2))
      #   return choice2
      # end
      # cc.map{ |n| next if !board.valid_move?(n)}
      # enum = (1..9).each
      # if(!board.valid_move?(enum.to_s))
      #   enum.to_s
      # end
        # cc = ["1","3","5","7","9","2","4","6","8"]
        # cc.each do |choice|
        #   choice.to_s
        # end


    end
  end
end



# 1 3 7 9 5



# if !board.valid_move?("1")
#   if !board.valid_move?("3")
#     if !board.valid_move("7")
#       if !board.valid_move("9")
#         if !board.valid_move("5")
#           while board.valid_move(choice2)
#             choice2
#           end
#         else
#           "5"
#         end
#       else
#         "9"
#       end
#     else
#       "7"
#     end
#   else
#     "3"
#   end
# else
#   "1"
# end
