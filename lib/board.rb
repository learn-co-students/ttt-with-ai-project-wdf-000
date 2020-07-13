class Board

 attr_accessor :cells

 def initialize
   @cells = [" "," "," "," "," "," "," "," "," "]
 end


 def reset!
   @cells = [" "," "," "," "," "," "," "," "," "]
   # .map{ |i| i = " " }
 end

 def display
   puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n-----------\n #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n-----------\n #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
 end

 def position(user_input)
   @cells[user_input.to_i - 1]
 end

 def full?
   @cells.all?{ |i| i == "X" || i == "O" }
 end

 def turn_count
   count = 0
   @cells.each do |i|
     if i == "X" || i == "O"
       count += 1
     end
   end

   count
 end

 def taken?(input)
   cell = input.to_i - 1
   @cells[cell] == "X" || @cells[cell] == "O"
 end

 def valid_move?(input)
   (input.to_i > 0 && input.to_i < 10) && !taken?(input)
 end

 def update (input, player = "X")
   @cells[input.to_i - 1] = player.token
   @cells
   # binding.pry
 end

end
