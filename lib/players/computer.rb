module Players
  class Computer < Player
    def move(board)
      index = (0..board.cells.size - 1).detect{|x| board.cells[x] == " "}
      (index + 1).to_s
    end
  end
end

=begin
my js minmax

var x = 0,
            o = 0,
            count = 0,
            w = 0,
            ix = 0
        ws = [0007, 0070, 0700, 0111, 0222, 0444, 0124, 0421]

        function t1(v) {
            var w1 = 0
            for (var i in ws)
                w1 |= !(v & ws[i] ^ ws[i])
            return w1
        }

        function t(i) {
            var ot = count % 2,
                m = 1 << (9 - i),
                bd = x | o
            if (m & bd) {
                alert('Position Taken')
                return
            }
            if ((ix && !ot) || (!ix && ot)) {
                if ((ix && count > 0) || !ix) {
                    var n1 = 0,
                        a1 = -2
                    while (bd & (1 << n1))
                        n1++
                        var n = n1
                    while (n1 < 9) {
                        var m1 = 1 << n1
                        if (!(bd & m1)) {
                            var bt = ix ? -mx(x | m1, o, count + 1) : -mx(x, o | m1, count + 1)
                            if (bt > a1) {
                                a1 = bt
                                n = n1
                            }
                        }
                        n1++
                    }
                } else
                    var n = [0, 2, 6, 8][Math.floor(Math.random() * 4)]
                w = ix ? t1(x |= 1 << n) : t1(o |= 1 << n)
                document.getElementById(9 - n).innerHTML = ot ? 'O' : 'X'
            } else {
                w = ix ? t1(o |= m) : t1(x |= m)
                document.getElementById(i).innerHTML = ot ? 'O' : 'X'
            }
            if (w)
                alert((ot ? "O" : "X") + " wins!")
            else if (!((x | o) ^ 0777))
                alert('Draw.')
            if ((ix && ot) || (!ix && !ot)) {
                count++
                if ((x | o) ^ 0777 && !w)
                    t(-1)
                count++
            } else
                return
            return
        }

        function mx(x1, o1, c1) {
            var ot1 = c1 % 2,
                w1 = ot1 ? t1(x1) : t1(o1),
                b1 = x1 | o1,
                p = 0400
            if (w1)
                return -1
            if (!(b1 ^ 0777))
                return 0
            var a = -2
            while (p > 0) {
                if (!(b1 & p))
                    a = Math.max(a, -mx(ot1 ? x1 : x1 | p, ot1 ? o1 | p : o1, c1 + 1))
                p >>= 1
            }
            return a
        }

        function ys() {
            rs()
            ix = 1
            t(-1)
            count++
        }

        function rs() {
            for (var d = 1; d <= 9; d++)
                document.getElementById(d).innerHTML = ''
            x = 0
            o = 0
            count = 0
            w = 0
            ix = 0
            return
        }
        rs()
=end
