module Players

class Human < Player

def move(cells)
  super
  puts "Please make your next move."
  next_move = gets.chomp
end

end



end


# cells[next_move.to_i - 1] = @token
# if other person looks like they might win then go for it
#try to win myself
