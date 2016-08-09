module Players
	
	class Computer < Player
	
	def move(board)
		# rand(1..9).to_s
		if !board.taken?("5")
			"5"
		elsif board.taken?("5") && !self.any_corner_taken?(board)
			self.corner_move
		else
			self.move_for_best_result(board)
		end
	end

	def move_for_best_result(board)
		if  board.cells.count{|cell| cell == " "} == 1
			# last_move
			last_move(board)
		elsif self.win_before_block(board) != nil
			self.move_after_detect(board)
		elsif self.corner_all_taken?(board)
			rand(1..9).to_s
		elsif self.center_all_taken?(board)
			rand(1..9).to_s
		elsif self.any_corner_taken?(board)
			self.center_or_corner_move(board)
		end
	end

	def center_or_corner_move(board)
		# binding.pry
		if (board.cells[0] == board.cells[8] && board.cells[0] != " ") || (board.cells[2] == board.cells[6] && board.cells[2] != " ")
			self.center_move
		elsif board.cells[0] == board.cells[4] ||  board.cells[4] == board.cells[8]
			self.corner_move
		elsif board.cells[2] == board.cells[4] ||  board.cells[4] == board.cells[6]
			self.corner_move
		else
			self.corner_move
		end
	end

	def any_corner_taken?(board)
		["1", "3", "7", "9"].any?{|position| board.taken?(position)}
	end

	def corner_all_taken?(board)
		["1", "3", "7", "9"].all?{|position| board.taken?(position)} 
	end

	def center_all_taken?(board)
		["2", "4", "6", "8"].all?{|position| board.taken?(position)} 
	end

	def corner_move
		["1", "3", "7", "9"].sample
	end

	def center_move
		["2", "4", "6", "8"].sample 
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
		 Game::WIN_COMBINATIONS.detect do |win_combination|
			win_combination.count{|win_index| board.cells[win_index] == self.token} == 2 && win_combination.count{|win_index| board.cells[win_index] == " "} == 1
		end
	end

	def block_detect(board)
		 Game::WIN_COMBINATIONS.detect do |win_combination|
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