class Computer
  def initialize(grid)
    @grid = grid
  end
  def move
    choice = nil
    loop do
      row = Random.rand(0..2)
      col = Random.rand(0..2)
      choice = @grid[row][col]
      unless choice.is_a?(String) # Assuming "x" and "o" are strings
        @grid[row][col] = "x" # Assuming the computer plays as "o"
        break
      end
    end
    puts choice
  end
end 