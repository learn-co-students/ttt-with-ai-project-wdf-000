require_relative '../player.rb'
require 'pry'

module Players

	class Computer < Player
	WIN_COMBINATIONS = [[0,1,2],
						[3,4,5],
						[6,7,8],
						[0,3,6],
						[1,4,7],
						[2,5,8],
						[0,4,8],
						[6,4,2]]

		attr_reader :tracker , :mytok , :entok

		#gets extra variable here
		def initialize(token)
			super(token)
			@mytok = token
			#detect enemy token and my token
			token == "X" ? @entok = "O" : @entok = "X" 
			@tracker = Array.new(9,0)
		end
		def move(board)
			#takes the middle if possible
			if board.valid_move?('5')
				puts "My move, I have settled on 5"
				return '5'
			elsif board.turn_count < 2
				#if middle taken, proceed to occupy the corners only if the turn count is less than 2
				#dont ask why, thats just what I would do
				#for randomness and easyness
				tmp = ['1','2','3','4','6''7','8','9'].sample 
				#for harder mode
				#tmp = ['1','3','7','9'].sample 
				puts "My move, I have settled on " + tmp
				return tmp 
			end
			#begin AI
			#checks for enemy token and increase the likelyhood of settling on that row by 5
			WIN_COMBINATIONS.each do |x|
				x.each do |y|
					if board.cells[y] == @entok
						#x.each { |j| @tracker[j] += 5 } 
						@tracker[y] += 5
					end
				end
			end

			#my token section
			WIN_COMBINATIONS.each do |x|
				x.each do |y|
					if board.cells[y] == @mytok
						#x.each { |j| @tracker[j] += -7 }
						@tracker[y] -= 6
					end
				end
			end

			sum =  []
			WIN_COMBINATIONS.each do |x|
				hold = 0
				x.each do |y|
					hold += @tracker[y]
				end
				sum << hold
			end

			#prevent tmp from becoming nil, removing the largest num and move to the next num
			tmp = nil
			while tmp == nil
				sum = sum.map { |n| n.abs }
				combo = sum.index( sum.max )
				sum[combo] = 0
				tmp = WIN_COMBINATIONS[combo].detect do | x |
					board.cells[x] == " "
				end
			end

			#convert to string
			tmp = (tmp + 1).to_s
			puts "My move, I have settled on " + tmp
			return tmp
		end
	end

end
