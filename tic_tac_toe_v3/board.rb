class Board
  
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, "_") }
  end

  def valid?(position)
    row = position[0]
    col = position[1]
    n = @grid.length
    if 0 <= row && row < n && 0 <= col  && col < n
      return true
    end
    false
  end

  def empty?(position)
    row = position[0]
    col = position[1]
    return true if @grid[row][col] == "_"
    false
  end

  def legal_positions
    pos_arr = []
    @grid.each_with_index do |subarr, row|
      subarr.each_with_index do |elem, col|
        if elem == "_"
          position = [row, col]
          pos_arr << position
        end
      end
    end
    pos_arr
  end

  def place_mark(position, mark)
    if !valid?(position)
      raise Exception
    elsif !empty?(position)
      raise Exception
    end

    row = position[0]
    col = position[1]
    @grid[row][col] = mark
  end

  def print
    @grid.each do |subarr|
      puts subarr.join(" ")
    end
  end

  def win_row?(mark)
    n = @grid.length
    (0...n).each do |row|
      count = 0
      (0...n).each { |col| count += 1 if @grid[row][col] == mark }
      return true if count == n
    end
    false
  end

  def win_col?(mark)
    n = @grid.length
    (0...n).each do |col|
      count = 0
      (0...n).each { |row| count += 1 if @grid[row][col] == mark }
      return true if count == n
    end
    false
  end

  def win_diagonal?(mark)
    n = @grid.length
    
    count = 0
    (0...n).each do |idx|
      count += 1 if @grid[idx][idx] == mark
    end
    return true if count == n

    count = 0
    (0...n).each do |idx|
      count += 1 if @grid[idx][n - idx - 1] == mark
    end
    return true if count == n
    false
  end

  def win?(mark)
    return true if self.win_col?(mark) || self.win_row?(mark) || self.win_diagonal?(mark)
    false
  end

  def empty_positions?
    n = @grid.length
    (0...n).each do |row|
      (0...n).each do |col|
        return true if self.empty?([row, col])
      end
    end
    false
  end

end