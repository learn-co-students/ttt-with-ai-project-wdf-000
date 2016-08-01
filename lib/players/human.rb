
require 'pry'

module Players
  class Human < Player



      def move(b)

         input = gets.chomp

          # while out_of_range?(input) || not_valid?(input)
           while !(input.to_i > 0 && input.to_i < 10 && input.to_i != 0 )
             input = gets.chomp
           end
             input

      end



  end
end
