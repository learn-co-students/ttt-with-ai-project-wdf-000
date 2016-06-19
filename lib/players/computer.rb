module Players
  class Computer < Player
    def move(board)
      index = (0..board.cells.size - 1).detect{|x| board.cells[x] == " "}
      (index + 1).to_s
    end
  end
end
