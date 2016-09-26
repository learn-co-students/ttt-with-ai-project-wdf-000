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
#calculate draw combos, iterate though and base ai over moves on it

#dumdum AI will lose more often than not, CLI often breaks if game_type == ai_vs_ai
    def move(board)
      if (board.cells[0] || board.cells[2] || board.cells[4] || board.cells[6] || board.cells[8]) == "X"
        ai_move = ["2", "4", "6", "8"]
        ai_move.sample
      elsif (board.cells[1] || board.cells[3] || board.cells[5] || board.cells[7]) == "X"
        ai_move = ["1", "3", "5", "7", "9"]
        ai_move.sample
      elsif (board.cells[0] || board.cells[2] || board.cells[4] || board.cells[6] || board.cells[8]) == "O"
        ai_move = ["2", "4", "6", "8"]
        ai_move.sample
      elsif (board.cells[1] || board.cells[3] || board.cells[5] || board.cells[7]) == "O"
        ai_move = ["1", "3", "5", "7", "9"]
        ai_move.sample
      else
        ai_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        ai_move.sample
      end
    end
  end
end
