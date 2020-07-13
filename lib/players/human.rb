module Players
  class Human < Player
    attr_accessor :token

    def move(board = nil)
      position = gets.strip
      position
    end  
  
  end

end