class Player 
  def initialize(grid)
    @grid = grid
  end

  def choice
    while true
      puts 'Choose your placement:'
      input = gets.to_i
      if @grid.flatten.include?(input)
        update_grid(input, "o") # Assuming the player plays as "x"
        break
      else
        puts "Invalid choice, please try again."
      end
    end  
  end

  private

  def update_grid(input, player)
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if cell == input
          @grid[row_index][col_index] = player
          return
        end
      end
    end
  end
end