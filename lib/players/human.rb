module Players
	
	class Human < Player

		def move(board)
			puts "Which position would you like to make a move on? Please enter 1-9:"
			input = gets.strip
			input
		end

	end

end