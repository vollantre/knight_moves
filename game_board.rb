require_relative 'knight'

class GameBoard
  attr_accessor :knight, :squares
  def initialize
      @squares = Array.new(8) { Array.new(8, " ") }
      @knight = Knight.new
  end

  def display
      rows
      @squares.each_index do |x|
          print "#{x}  "
          @squares[x].each_index do |y|
              print "| #{@squares[x][y]}  "
          end
          puts "|"
          rows
      end
      print "   "
      (0..7).each {|number| print "  #{number}  "}
      puts ""
  end

  def rows
      print "   "
      8.times { print "+----" }
      puts "+"
  end
end