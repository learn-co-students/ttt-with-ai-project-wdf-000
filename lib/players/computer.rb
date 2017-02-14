module Players
  class Computer < Player
    include Engine

    def move(board)
      x,o = convert_board_to_x_o(board.cells.reverse)
      (t(x,o)).to_s
    end
  end
end
