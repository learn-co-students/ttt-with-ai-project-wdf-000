module Players
  class Computer < Player
    COUNTERS = {1 => [2,3,4,7,5,9], 2 => [1,3,5,8], 3 =>[1,2,5,6,7,9], 4 => [1,5,6,7], 5 => [2,3,6,7,8], 6 => [3,4,5,9], 7 => [1,3,4,5,8,9], 8 => [2,5,7,9], 9 => [1,3,5,6,7,8]}
    def move(board)
      opponent, taken = [], []
      board_nums = [1,2,3,4,5,6,7,8,9] 
      board.cells.each_with_index {|cell, i| opponent << i + 1 if (cell != " " && cell != token)}
      board.cells.each_with_index {|cell, i| taken << i + 1 if cell == token}
      if board.cells.count(" ") == 9
	choice = [1,3,7,9].shuffle[0].to_s
	taken << choice
	choice
      elsif board.cells.count(" ") == 1
        board.cells.find_index(" ") + 1
      elsif board.cells.count(" ") < 9 && board.cells.count(" ") > 6
	choice = ([1,3,7,9] - taken - opponent).shuffle[0]
	taken << choice
	choice
      elsif opponent.include?(1) && (COUNTERS[1] - taken - opponent) != []
	choice = (COUNTERS[1] - opponent - taken).shuffle[0]
	taken << choice
	choice
      elsif opponent.include?(2) && (COUNTERS[2] - taken - opponent) != []
	choice = (COUNTERS[2] - opponent - taken).shuffle[0]
	taken << choice
	choice
      elsif opponent.include?(3) && (COUNTERS[3] - taken - opponent) != []
	choice = (COUNTERS[3] - opponent - taken).shuffle[0]
        taken << choice
	choice
      elsif opponent.include?(4) && (COUNTERS[4] - taken - opponent) != []
	choice = (COUNTERS[4] - opponent - taken).shuffle[0]
        taken << choice
	choice
      elsif opponent.include?(5) && (COUNTERS[5] - taken - opponent) != []
    	choice = (COUNTERS[5] - opponent - taken).shuffle[0]
        taken << choice
	choice
      elsif opponent.include?(6) && (COUNTERS[6] - taken - opponent) != []
	choice = (COUNTERS[6] - opponent - taken).shuffle[0]
	taken << choice
	choice
      elsif opponent.include?(7) && (COUNTERS[7] - taken - opponent) != []
	choice = (COUNTERS[7] - opponent - taken).shuffle[0]
        taken << choice
	choice
      elsif opponent.include?(8) && (COUNTERS[8] - taken - opponent) != []
	choice = (COUNTERS[8] - opponent - taken).shuffle[0]
	taken << choice
	choice
      elsif opponent.include?(9) && (COUNTERS[9] - taken - opponent) != []
	choice = (COUNTERS[9] - opponent - taken).shuffle[0]
	taken << choice
	choice 
      end
    end
  end
end
