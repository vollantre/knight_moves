class Vertex
  attr_accessor :value, :neighbors, :prev, :dist
  def initialize(value)
      @value = value
      @neighbors = []
      @prev = nil
      @dist = Float::INFINITY
  end

  def add_edge(adjacent_vertex)
      @neighbors << adjacent_vertex
  end
end

class Graph
  attr_reader :vertices
  def initialize
      @vertices = {}
      @dijkstra_source = nil
  end

  def add_vertex(vertex)
      @vertices[vertex.value] = vertex
  end

  def add_edge(vertex1, vertex2)
      @vertices[vertex1.value].add_edge(@vertices[vertex2])
      @vertices[vertex2.value].add_edge(@vertices[vertex1])
  end

  def dijkstra(source)
    return if @dijkstra_source == source
      unvisited = @vertices.values
      unvisited.each do |vertex|
          vertex.dist = Float::INFINITY
          vertex.prev = nil
      end
      @vertices[source].dist = 0
      until unvisited.empty?
          current_node = unvisited.min_by(&:dist)
          break if current_node.dist == Float::INFINITY
          unvisited.delete(current_node)
          current_node.neighbors.each do |v|
              neighbor = @vertices[v]
              if unvisited.include?(neighbor)
                  alt = current_node.dist + 1
                  if alt < neighbor.dist
                    neighbor.dist = alt
                    neighbor.prev = current_node 
                  end
              end
          end
      end
      @dijkstra_source = source
  end

  def find_shortest_path(source, target)
      dijkstra(source)
      path = []
      u = target
      while u
          path.unshift(u)
          u = (@vertices[u].prev.value if @vertices[u].prev)
      end
      return path
  end
end