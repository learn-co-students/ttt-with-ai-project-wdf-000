class Board

	attr_accessor :cells

	def initialize
		self.cells = Array.new(9, " ")
	end

	def reset!
		self.cells.clear
		self.cells = Array.new(9, " ")
	end

	def display
		puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
		puts "-----------"
		puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
		puts "-----------"
		puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
		puts "---------------------------------"
	end

	def position(input)
		self.cells[input.to_i-1]
	end

	def full?
		!self.cells.include?(" ")
	end

	def turn_count
		self.cells.count{|cell| cell == "O" || cell == "X"}
	end

	def taken?(position)
		self.cells[position.to_i-1] != " "
	end

	def valid_move?(input)
		input.to_i.between?(1,9) && !self.taken?(input)
	end

	def update(position, player)
		self.cells[position.to_i-1] = player.token
	end

end