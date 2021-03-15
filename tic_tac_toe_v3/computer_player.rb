class ComputerPlayer

  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    random_pos = legal_positions.sample
    puts "Computer " + self.mark.to_s + " chose position " + random_pos.to_s
    random_pos
  end

end