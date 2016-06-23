module Engine

  # convert board from array of strings to an x-bitboard and an o-bitboard
  def convert_board_to_x_o(board)
    (0..board.size - 1).inject([0,0]) do |xo,i|
      if board[i] == 'X'
        xo[0] |= 1 << i
      elsif board[i] == 'O'
        xo[1] |= 1 << i
      end
      
      xo
    end
  end


# This minimax implementation was adapted from my answer on Stack Overflow, Aug 31, 2013; link: http://stackoverflow.com/questions/18548265/testing-tic-tac-toe-win-condition/18549674#18549674

#plays both
#$x = 0
#$o = 0
#$count = 0
#$w = 0
#$ix = 0

def t1(v)
  w1 = false
  [0007,0070,0700,0111,0222,0444,0124,0421].each{|i| w1 |= if (v & i ^ i) < 1 then true else false end}
  w1
end

def t(x,o)
  count_x = (0..Math.log2(x)).reduce(0){|s,i| s + x[i]}
  count_o = (0..Math.log2(o)).reduce(0){|s,i| s + o[i]}
  count = count_x + count_o
  if count % 2 == 0 then ix = 1 else ix = 0 end
	
  ot = count % 2
  #m = 1 << (9 - i)
  bd = x | o
=begin
  if ix > 0 && ot > 0 && (i > 9 || i < 1 || i != i.floor)
    return "Out of bounds."
  elsif m & bd > 0
    return "Position taken."
  end
=end
  if (ix > 0 && ot < 1) || (ix < 1 && ot > 0)
    if (ix > 0 && count > 0) || ix < 1
      n1 = 0
      a1 = -2
      while (bd & (1 << n1)) > 0
        n1 += 1
      end

      n = n1

      while n1 < 9
        m1 = 1 << n1

        if bd & m1 < 1
          bt = ix > 0 ? -mx(x | m1, o, count + 1)
                       : -mx(x, o | m1, count + 1)
          if bt > a1
            a1 = bt
            n = n1
          end
        end

        n1 += 1
      end
    else
      n = [0,2,6,8][rand(0..3)]
    end

    w = ix > 0 ? t1(x |= 1 << n) : t1(o |= 1 << n)
  else
    w = ix > 0 ? t1(o |= m) : t1(x |= m)
  end

  b = "\n"
  p = 0400
=begin
  while p > 0
    if p & $x > 0
      b += "x"
    elsif p & $o > 0
      b += "o"
    else
      b += "."
    end

    if p & 0110 > 0
        b += "\n"
    end

    p >>= 1
  end

  if w
    b += "\n\n" + (ot > 0 ? "o" : "x") + " wins!"
  elsif ($x | $o) ^ 0777 < 1
    b += "\n\nDraw."
  end
=end
  if (ix > 0 && ot > 0) || (ix < 1 && ot < 1)
    #puts b + '\n\n"""'
    count += 1
    if ($x | $o) ^ 0777 > 0 && !w
      #puts t(-1)
    end
    count += 1
  else
    #return b + "\n"
    return 9 - n
  end

  #return '"'
  return 9 - n
end

# minimax
def mx(x1,o1,c1)
  ot1 = c1 % 2
  w1 = ot1 > 0 ? t1(x1) : t1(o1)
  b1 = x1 | o1
  p = 0400

  if w1
    return -1
  end

  if b1 ^ 0777 < 1
    return 0
  end

  a = -2

  while p > 0
    if b1 & p < 1
      a = [a, -mx(ot1 > 0 ? x1 : x1 | p, ot1 > 0 ? o1 | p : o1, c1 + 1)].max
    end
    p >>= 1
  end

  return a
end

# computer starts
def ys
  ix = 1
  puts t($x,$o)
  #count += 1
end

# reset game
def rs
  $x = 0
  $o = 0
  count = 0
  w = 0
  ix = 0

  puts '              TicTacToe!'
  puts 'To play, type t(MOVE); MOVE is from 1-9. Type ys to have the
computer start; type rs to start over.'

  return '"'
end

#rs

end
