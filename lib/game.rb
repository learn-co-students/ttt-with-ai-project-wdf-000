class Game
	WIN_COMBINATIONS = [[0,1,2],
						[3,4,5],
						[6,7,8],
						[0,3,6],
						[1,4,7],
						[2,5,8],
						[0,4,8],
						[6,4,2]]
	attr_accessor :board, :player_1, :player_2

	def initialize (player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
		@player_1 = player_1
		@player_2 = player_2
		@board = board
	end
	def current_player
		@board.current_player == @player_1.token ? @player_1 : @player_2 
	end

	#got this function from previous assignmetns
	def over?
		draw? || won?
	end
	
	def won?
		WIN_COMBINATIONS.any? do |x|
			@board.cells[x[0]] == @board.cells[x[1]] &&
			@board.cells[x[0]] == @board.cells[x[2]] &&
			@board.taken?((x[1]+1).to_s)
		end
	end
	def draw?
		!won? && @board.full?
	end

	def winner
		win = nil
		WIN_COMBINATIONS.each do |x|
			if (
			@board.cells[x[0]] == @board.cells[x[1]] &&
			@board.cells[x[0]] == @board.cells[x[2]] &&
			@board.taken?((x[1]+1).to_s) )
				win = board.cells[x[0]]
				break
			end
		end
		win
	end

	def turn
		player = current_player
		input = ""
		loop do
			input = player.move(@board)
			break if @board.valid_move?(input)
		end
		@board.display
		@board.update(input,player)
		@board.display
	end

	def play
		until over?
			turn
		end
		if won?
			puts "Congratulations " + winner.to_s + "!"
		else
			puts "Cats Game!"
		end
	end
end
