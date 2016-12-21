module Players
  class Computer < Player
    attr_accessor :token, :board

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    def move(board = nil)
      @board = board
      if win_game
        win_game.to_s
      elsif !@board.taken?("5")
        return "5"
      else
        return rand(1..9).to_s
      end
    end

    def opponent_token
      token == "X" ? "O" : "X"
    end

    def win_game
      position = nil
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board.cells[win_index_1]
        position_2 = @board.cells[win_index_2]
        position_3 = @board.cells[win_index_3]

        board_status = [position_1, position_2, position_3]
        if board_status.count(opponent_token) == 2 && board_status.count(" ") == 1
          win_position = board_status.index(" ")
          position = win_combination[win_position] + 1
        elsif board_status.count(token) == 2 && board_status.count(" ") == 1
          win_position = board_status.index(" ")
          position = win_combination[win_position] + 1
        elsif board_status.count(opponent_token) == 1 && board_status.count(" ") == 2
          win_position = board_status.index(" ")
          position = win_combination[win_position] + 1
        end
      end
      return position
    end
  end
end
