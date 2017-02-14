module Players

  class Computer < Player

      WIN_COMBINATIONS = [
                      [0, 1, 2],
                      [3, 4, 5], 
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]
                    ]

    def random_corner
      corner_array = ["1", "3", "7", "9"]
      corner_array.sample
    end

    def random_edges
      corner_array = ["2", "4", "6", "8"]
      corner_array.sample
    end

    def random_move
      random = ["1", "2", "3", "4", "5", "6", "7", "8" "9"]
      random.sample
    end

    def move(board)
      if(win?(board))
        win_play(board)
      elsif(block?(board))
        block_play(board)
      elsif(center?(board))
        center_play(board)
      elsif(corners?(board))
        corners_play(board)
      elsif(edges?(board))
        edges_play(board)
      end

    end



    def win?(board)
      #The bug is here, win is allowing it to go into win play
      #when it should actually be going into block play
      result = false
      WIN_COMBINATIONS.each do |win_combo|

        win_index1 = win_combo[0]
        win_index2 = win_combo[1]
        win_index3 = win_combo[2]
        pos1 = board.cells[win_index1]
        pos2 = board.cells[win_index2]
        pos3 = board.cells[win_index3]

        array = []
        array = array.push(pos1, pos2, pos3).combination(2).to_a
        array.each do |pairs|
          if pairs.all?{ |token| token == self.token }
            result = true
          end
        end
      end
      result
    end



    def win_play(board)
      spot = nil
      WIN_COMBINATIONS.each do |win_combo|
        win_index1 = win_combo[0]
        win_index2 = win_combo[1]
        win_index3 = win_combo[2]
        pos1 = board.cells[win_index1]
        pos2 = board.cells[win_index2]
        pos3 = board.cells[win_index3]

        first_array = []
        first_array = first_array.push(pos1, pos2, pos3)
        second_array = first_array.combination(2).to_a
        second_array.each do |pairs|
          if pairs.all?{ |token| token == self.token }
           spot = (win_combo[first_array.index(" ")]+1).to_s
          end
        end
      end
      spot
    end

  def block?(board)
    result = false
      WIN_COMBINATIONS.each do |block_combo|

        block_index1 = block_combo[0]
        block_index2 = block_combo[1]
        block_index3 = block_combo[2]
        pos1 = board.cells[block_index1]
        pos2 = board.cells[block_index2]
        pos3 = board.cells[block_index3]
        array = []
        array = array.push(pos1, pos2, pos3).combination(2).to_a
        array.each do |pairs|
          if pairs.all?{ |token| token != self.token && token != " " }
            result = true
          end
        end
      end
      result
  end


  def block_play(board)
      spot = nil
      WIN_COMBINATIONS.each do |block_combo|
        block_index1 = block_combo[0]
        block_index2 = block_combo[1]
        block_index3 = block_combo[2]
        pos1 = board.cells[block_index1]
        pos2 = board.cells[block_index2]
        pos3 = board.cells[block_index3]

        first_array = []
        first_array = first_array.push(pos1, pos2, pos3)
        second_array = first_array.combination(2).to_a
        second_array.each do |pairs|
          if pairs.all?{ |token| token != self.token && token != " "}
           spot = (block_combo[first_array.index(" ")]+1).to_s
          end
        end
      end
    spot
  end

  def center?(board)
    !board.taken?("5")
  end

  def center_play(board)
    "5"
  end
  
  def corners?(board)
   !board.taken?(1) || !board.taken?(3) || !board.taken?(7) || !board.taken?(9)
  end

  def corners_play(board)
    random_corner
  end

  def edges?(board)
    !board.taken?(2) || !board.taken?(4) || !board.taken?(6) || !board.taken?(8)
  end

  def edges_play(board)
    random_edges
  end

  end

end