require_relative '../player.rb'

module Players

	class Human < Player
		
		def move(board)
			puts "Your move, enter 1 - 9: "
			gets.strip
		end
	end

end
