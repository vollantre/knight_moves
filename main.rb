require_relative 'game_board'

def knight_moves(source, target)
    game = GameBoard.new
    path = game.knight.graph.find_shortest_path(source, target)
    knight = game.knight
    game.squares[target[0]][target[1]] = knight.character
    game.display
    puts "You made it in #{path.length-1} moves"
    path.each {|move| p move }
end

knight_moves([3,0],[3,7])