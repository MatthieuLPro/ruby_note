module sudoku
  class puzzle
    ASCII = '.123456789'
    BIN = "\000\001\002\003\004\005\006\007\010\011"

    def initialize(lines)
      s = if(lines.respond_to? :join)
            lines.join
          else
            lines.dup
          end

      s.gsub!(/\s/, '')

      raise Invalid, "Grid is the wrong size" unless s.size == 81

      raise Invalid, "Illegal character #{s[i, 1]} in puzzle" if i = s.index(/[^123456789\.]/)

      s.tr!(ASCII, BIN)
      @grid = s.unpack('c*')
    end
  end
end