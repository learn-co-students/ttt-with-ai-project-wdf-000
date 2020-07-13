module Players
class Human < Player
  attr_reader :token

  def move(board)
    puts "Please enter a number between 1-9 to make your move:"
    input = gets.strip
  end
end
end
