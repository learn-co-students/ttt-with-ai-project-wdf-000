module Players
  class Human < Player
    def move(variable)
      puts "What move do you want to make?"
      input = gets.strip
    end
  end
end
