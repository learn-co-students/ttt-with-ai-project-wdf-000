# require_relative "../player.rb"
module Players
  class Human < Player

    def move(board)
      puts "please enter (1-9):"
      input = gets.chomp
      input
    end
  end
end