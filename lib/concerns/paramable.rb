require 'pry'
module Concerns::Paramable

  # does this belong here? checks if string is a number
  # source: http://stackoverflow.com/a/5661695
  def is_number?(string)
    true if Float(string) rescue false
  end

  def input_to_index(input)
    input.to_i - 1
  end

end