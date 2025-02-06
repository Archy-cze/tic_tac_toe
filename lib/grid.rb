class Grid 
  def initialize
    @values = [[1,2,3],[4,5,6],[7,8,9]]
  end 
  def render
    system "clear" 
    @values.each_with_index do |row, index|
      
      puts row.join(" | ")
      puts "--+---+--" unless index == @values.size - 1
    end
  end
  def update(player, key)
    @values.each_with_index do |value, index|
      value.each{|i| i=player if key == i}
    end
  end
  def check_win
    winning_combos.each do |combo|
      puts combo.all?{|i| i=="x" }
      if combo.all?{|i| i=="x" }
        return "x"
      elsif combo.all?{|i| i=="o" }
        return "o"
      
      else
        return nil
      end 
    end
  end
  def values
    return @values
  end

  def check_draw
    @values.flatten.none? { |cell| cell.is_a?(Integer) }
  end
  private

  def winning_combos
    rows = @values
    cols = @values.transpose
    diagonals = [
      [@values[0][0], @values[1][1], @values[2][2]],
      [@values[0][2], @values[1][1], @values[2][0]]
    ]
    rows + cols + diagonals
  end
end