require_relative 'lib/grid.rb'
# .render, .update(player, key)
# .check_win {returns x, o, nil}  .check_draw
require_relative 'lib/computer.rb'
# .move
require_relative 'lib/player'

start = Grid.new
computer = Computer.new(start.instance_variable_get(:@values))
player = Player.new(start.instance_variable_get(:@values))


def game_loop(start, player, computer)
    loop do
        start.render
        player.choice

        if start.check_win
            puts "#{start.check_win} wins!"
            break
        elsif start.check_draw
            puts "It's a draw!"
            break
        end
    
        computer.move
        start.render
        if start.check_win
            system "clear" 
            start.render
            puts "#{start.check_win} wins!"
            break
        elsif start.check_draw
            system "clear" 
            start.render
            puts "It's a draw!"
            break
        end
    end
end
  
  game_loop(start, player, computer)