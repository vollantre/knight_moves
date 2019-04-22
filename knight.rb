require_relative 'graph'

class Knight
  attr_reader :character, :graph
  def initialize
      @character = "♞"
      @possible_moves = nil
      @positions = Array.new(8) { Array.new(8, " ") }
      @move_set = [
                    [-1,-2],
                    [-2,-1],
                    [-2,+1],
                    [-1,+2],
                    [+1,+2],
                    [+2,+1],
                    [+2,-1],
                    [+1,-2]
                   ]
      @graph = generate_graph
      generate_edges
  end
  
  def generate_graph
    graph = Graph.new
      @positions.each_index do |x|
          @positions[x].each_index do |y|
              vertex = Vertex.new([x,y])
              graph.add_vertex(vertex)
          end
      end
      graph
  end

  def generate_edges
      @graph.vertices.each do |key, value|
          @move_set.each do |move|
              x = key[0] + move[0]
              y = key[1] + move[1]
              if (0..7).include?(x) && (0..7).include?(y)
                  vertex = [x,y]
                  value.add_edge(vertex) unless value.neighbors.include?(vertex)
              end
          end
      end
  end
end