class Board
	attr_accessor :cells
	def initialize
		@cells = Array.new(9," ")
	end

	def reset!
		@cells = Array.new(9," ")
	end

	def display
		puts " " +  @cells[0] + " | " + @cells[1] + " | " + @cells[2] + " "
		puts "-----------"
		puts " " +  @cells[3] + " | " + @cells[4] + " | " + @cells[5] + " "
		puts "-----------"
		puts " " +  @cells[6] + " | " + @cells[7] + " | " + @cells[8] + " "
	end

	def position (position)
		@cells[position.to_i-1]
	end

	def full?
		@cells.all?{ |x| x == "O" || x == "X" }
	end

	def turn_count
		count = 0
		@cells.each { |x| count += 1 if ( x == "O" || x == "X" ) }
		count
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	def taken?(x)
		( position(x) == "O" || position(x) == "X" ) 
	end

	def valid_move?( x )
		(x.to_i > 0 && x.to_i <= 9 && !taken?(x) )
	end

	def update(position,player)
		@cells[position.to_i-1] = player.token
	end
end
