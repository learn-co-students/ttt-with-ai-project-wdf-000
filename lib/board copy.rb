# require 'pry'
# class Board 

#   attr_accessor :cells

#   def initialize
#     @cells = Array.new(9, " ")
#   end

#   def reset!
#     self.cells = Array.new(9, " ")
#   end

#   def display
#     puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
#     puts "-----------"
#     puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
#     puts "==========="
#     puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
#   end

#   def position(num)
#     self.cells[num.to_i-1]
#     # binding.pry
#   end

#   def full?
#     self.cells.include?(" ") ? false : true
#   end

#   def turn_count
#     9-self.cells.count(" ")
#   end

#   def taken?(pos)
#     self.cells[pos.to_i-1] != " " ? true : false
#   end

#   def valid_move?(pos)
#     taken?(pos.to_i) ? false : true && pos.to_i.between?(1,9)
#   end

#   def update(pos, player)
#     cells[pos.to_i-1] = player.token
#     # binding.pry
#   end

#   def test_move(pos, token)
#     self.cells[pos.to_i-1] = token
#     self
#     # binding.pry
#   end

#   def get_available_positions
#       # binding.pry
#       self.cells.map.with_index(1) {|p, i| self.valid_move?(i) ? i : nil}.compact
#   end
# end 