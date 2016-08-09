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

	def move(board)
		# rand(1..9).to_s
		if  board.cells.count{|cell| cell == " "} == 1
			# last_move
			last_move(board)
		elsif self.win_before_block(board) != nil
			self.move_after_detect(board)
		elsif !board.taken?("5")
			"5"
		elsif ["1", "3", "7", "9"].any?{|position| board.taken?(position)} && !["2", "4", "6", "8"].all?{|position| board.taken?(position)}
			["2", "4", "6", "8"].sample
		else
			["1", "3", "7", "9"].sample
		end
	end

	def last_move(board)
		board.cells.each_with_index do |cell, index|
			if cell == " "
				return (index+1).to_s
			end
		end
	end

	def win_before_block(board)
		if self.win_detect(board) == nil
			self.block_detect(board)
		else
			self.win_detect(board)
		end
	end

	def win_detect(board)
		WIN_COMBINATIONS.detect do |win_combination|
			win_combination.count{|win_index| board.cells[win_index] == self.token} == 2 && win_combination.count{|win_index| board.cells[win_index] == " "} == 1
		end
	end

	def block_detect(board)
		WIN_COMBINATIONS.detect do |win_combination|
			(win_combination.count{|win_index| board.cells[win_index] == "X"} == 2 || win_combination.count{|win_index| board.cells[win_index] == "O"} == 2) && win_combination.count{|win_index| board.cells[win_index] == " "} == 1
		end
	end

	def move_after_detect(board)
		self.win_before_block(board).each do |win_index|
			if board.cells[win_index] == " "
				return (win_index+1).to_s
			end
		end
	end

	#end for the class
	end

#end for the module
end