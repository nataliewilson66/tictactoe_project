class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    puts "Player " + @mark.to_s + "'s turn"
    puts "Enter a position with coordinates separated with a space like `1 2` "
    status = false
    while status == false
      pos_str = gets.chomp
      position = pos_str.split(" ").map { |elem| elem.to_i }
      if !legal_positions.include?(position)
        puts "Illegal input - Please enter another position"
      else
        status = true
      end
    end
    position
  end

end