class Board

attr_accessor :cells

@cells = []

def initialize
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end


def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end


def reset!
  @cells.clear
  @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

def position(user_input)
  @cells[user_input.to_i - 1]
end

def update(input, current_player)
  current_position = input.to_i - 1
  @cells[current_position] = token
end

def token
  turn_count.even? ? "X" : "O"
end

def full?
  empties = @cells.select{|position| position == " "}
  empties == []
end

def turn_count
   @cells.count{|token| token == "X" || token == "O"}
end

def valid_move?(input)
  current_position = input.to_i - 1
  current_position.between?(0,8) && !taken?(input) && input.length == 1
end

def taken?(input)
  position = input.to_i - 1
  @cells[position] != " " && @cells[position] != ""
end

end
