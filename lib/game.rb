class Game

	attr_accessor :board, :player_1, :player_2

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

	def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
		self.player_1 = player_1
		self.player_2 = player_2
		self.board = board
	end

	def current_player
		self.board.turn_count % 2 == 0 ? self.player_1 : self.player_2
	end

	def over?
		self.board.full?
	end

	def won?
		WIN_COMBINATIONS.detect do |win_combination|
			win_combination.all?{|win_index| self.board.cells[win_index] == "X"} || win_combination.all?{|win_index| self.board.cells[win_index] == "O"}
		end
	end

	def draw?
		self.over? && !self.won?
	end

	def winner
		# binding.pry
		if self.won?
			self.board.cells[self.won?.first]
		end
	end

	def turn
		input = self.current_player.move(self.board)
		if self.board.valid_move?(input)
			self.board.update(input, self.current_player)
			self.board.display
		else
			turn
		end
	end

	def play
		until self.won? || self.draw?
			if self.current_player.class == Players::Human
				puts "#{self.current_player.name}, it's your turn."
			end
			turn
		end
		if self.won?
			puts "Congratulations #{self.winner}!"
		elsif self.draw?
			puts "Cats Game!"
		end
	end

end