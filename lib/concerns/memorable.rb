module Concerns::Memorable

  def display_board(cells)
    border = "|"
    separator = "-----------"
    index = 0
    output = ""
    while index < cells.length do
      output += " #{cells[index]} "
      if index == 2 || index == 5
        output += "\n#{separator}\n"
      elsif index == 8
        output += "\n"
      else
        output += "#{border}"
      end
      index += 1
    end
    puts output
  end

end