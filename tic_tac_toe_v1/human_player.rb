class HumanPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    puts "Player " + @mark.to_s + "'s turn"
    puts "Enter a position with coordinates separated with a space like `1 2` "
    pos_str = gets.chomp
    position = pos_str.split(" ")
    if position.length > 2
      puts "Please enter position in correct format"
      raise Exception
    end
    position.map { |elem| elem.to_i }
  end

end