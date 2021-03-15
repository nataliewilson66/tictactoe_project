class Board
  
  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end

  def valid?(position)
    x = position[0]
    y = position[1]
    if 0 <= x && x <= 2 && 0 <= y  && y <= 2
      return true
    end
    false
  end

  def empty?(position)
    x = position[0]
    y = position[1]
    return true if @grid[x][y] == "_"
    false
  end

  def place_mark(position, mark)
    if !valid?(position)
      raise Exception
    elsif !empty?(position)
      raise Exception
    end

    x = position[0]
    y = position[1]
    @grid[x][y] = mark
  end

  def print
    @grid.each do |subarr|
      puts subarr.join(" ")
    end
  end

  def win_row?(mark)
    @grid.each do |subarr|
      if subarr[0] == mark && subarr[1] == mark && subarr[2] == mark
        return true
      end
    end
    false
  end

  def win_col?(mark)
    (0..2).each do |x|
      if @grid[0][x] == mark && @grid[1][x] == mark && @grid[2][x] == mark
        return true
      end
    end
    false
  end

  def win_diagonal?(mark)
    if @grid[0][0] == mark && @grid[1][1] == mark && @grid[2][2] == mark
      return true
    elsif @grid[0][2] == mark && @grid[1][1] == mark && @grid[2][0] == mark
      return true
    end
    false
  end

  def win?(mark)
    return true if self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
    false
  end

  def empty_positions?
    (0..2).each do |x|
      (0..2).each do |y|
        return true if self.empty?([x, y])
      end
    end
    false
  end

end