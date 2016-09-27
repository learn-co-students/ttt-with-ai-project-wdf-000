module Players
  class Computer < Player

    attr_reader :move
#todo
#board = ["X", "", "", "", "", "", "", "",""]
#board = ["X", "O", "", "", "X", "", "", "",""]
#board = ["X", "O", "", "", "X", "", "", "",""]
#board = ["X", "O", "", "", "X", "", "", "","O"]
#board = ["X", "O", "X", "", "X", "", "", "","O"]
#board = ["X", "O", "X", "", "X", "", "O", "","O"]
#board = ["X", "O", "X", "", "X", "X", "O", "","O"]
#board = ["X", "O", "X", "O", "X", "X", "O", "","O"]
#board = ["X", "O", "X", "O", "X", "X", "O", "","O"]
#board = ["X", "O", "X", "O", "X", "X", "O", "X","O"]
#calculate draw combos as a class constant, iterate though and base ai over moves on it, will the AI refuse to win in an Ai vs Human game in this case?  
#If not, maybe this should be implemented.  
#would be interesting to see two opposing dumdums racing to bottom in a more multi-faceted game, 
#like Lemmings the game meets Iodiocracy the movie
    
    def move(board)
      if current_player.token == "X" && board.cells[0] == "X" && board.cells[1] == "O"|| board.cells[3] == "O"|| board.cells[4] == "O"
        ai_move = ["3", "5", "6", "8"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[1] == "X" && board.cells[0] == "O"|| board.cells[2] == "O"|| board.cells[3] == "O" || board.cells[4] == "O" || board.cells[5] == "O"
        ai_move = ["4", "5", "6", "8"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[2] == "X" && board.cells[1] == "O"|| board.cells[4] == "O"|| board.cells[5] == "O" 
        ai_move = ["1", "5", "7", "9"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[3] == "X" && board.cells[0] == "O"|| board.cells[1] == "O"|| board.cells[4] == "O" || board.cells[6] == "O" || board.cells[7] == "O"
        ai_move = ["4", "5", "6", "8"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[4] == "X" && board.cells[0] == "O"|| board.cells[1] == "O"|| board.cells[2] == "O" || board.cells[3] == "O" || board.cells[5] == "O" || board.cells[6] == "O" || board.cells[7] == "O" || board.cells[8] == "O"
        ai_move = ["1", "3", "7", "9"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[5] == "X" && board.cells[1] == "O"|| board.cells[2] == "O"|| board.cells[4] == "O" || board.cells[7] == "O" || board.cells[8] == "O"
        ai_move = ["3", "4", "5", "9"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[6] == "X" && board.cells[3] == "O"|| board.cells[4] == "O"|| board.cells[7] == "O" 
        ai_move = ["1", "3", "5", "9"]
        ai_move.sample      
      elsif current_player.token == "X" && board.cells[7] == "X" && board.cells[3] == "O"|| board.cells[4] == "O"|| board.cells[5] == "O" || board.cells[6] == "O" || board.cells[8] == "O"
        ai_move = ["2", "5", "7", "9"]
        ai_move.sample
      elsif current_player.token == "X" && board.cells[8] == "X" && board.cells[4] == "O"|| board.cells[5] == "O"|| board.cells[7] == "O" 
        ai_move = ["1", "3", "5", "6"]        
        ai_move.sample
        
      elsif current_player.token == "O" && board.cells[0] == "O" && board.cells[1] == "X"|| board.cells[3] == "O"|| board.cells[4] == "O"
        ai_move = ["3", "5", "6", "8"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[1] == "O" && board.cells[0] == "X"|| board.cells[2] == "X"|| board.cells[3] == "X" || board.cells[4] == "X" || board.cells[5] == "X"
        ai_move = ["4", "5", "6", "8"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[2] == "O" && board.cells[1] == "X"|| board.cells[4] == "X"|| board.cells[5] == "X" 
        ai_move = ["1", "5", "7", "9"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[3] == "O" && board.cells[0] == "X"|| board.cells[1] == "X"|| board.cells[4] == "X" || board.cells[6] == "X" || board.cells[7] == "X"
        ai_move = ["4", "5", "6", "8"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[4] == "O" && board.cells[0] == "X"|| board.cells[1] == "X"|| board.cells[2] == "X" || board.cells[3] == "X" || board.cells[5] == "X" || board.cells[6] == "X" || board.cells[7] == "X" || board.cells[8] == "X"
        ai_move = ["1", "3", "7", "9"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[5] == "O" && board.cells[1] == "X"|| board.cells[2] == "X"|| board.cells[4] == "X" || board.cells[7] == "X" || board.cells[8] == "X"
        ai_move = ["3", "4", "5", "9"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[6] == "O" && board.cells[3] == "X"|| board.cells[4] == "X"|| board.cells[7] == "X" 
        ai_move = ["1", "3", "5", "9"]
        ai_move.sample      
      elsif current_player.token == "O" && board.cells[7] == "O" && (board.cells[3] == "X"|| board.cells[4] == "X"|| board.cells[5] == "X" || board.cells[6] == "X" || board.cells[8] == "X")
        ai_move = ["2", "5", "7", "9"]
        ai_move.sample
      elsif current_player.token == "O" && board.cells[8] == "O" && (board.cells[4] == "X"|| board.cells[5] == "X"|| board.cells[7] == "X") 
        ai_move = ["1", "3", "5", "6"]        
        ai_move.sample
        
      else
        ai_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        ai_move.sample
#    def move(board)
#        ai_move = ["2", "4", "6", "8"]
#        ai_move.sample
#      elsif (board.cells[1] || board.cells[3] || board.cells[5] || board.cells[7]) == "X"
#        ai_move = ["1", "3", "5", "7", "9"]
#        ai_move.sample
#     elsif (board.cells[0] || board.cells[2] || board.cells[4] || board.cells[6] || board.cells[8]) == "O"
#        ai_move = ["2", "4", "6", "8"]
#        ai_move.sample
#      elsif (board.cells[1] || board.cells[3] || board.cells[5] || board.cells[7]) == "O"
#        ai_move = ["1", "3", "5", "7", "9"]
#        ai_move.sample
#      else
#        ai_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#        ai_move.sample
      end
    end
  end
end
