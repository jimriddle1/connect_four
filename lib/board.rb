class Board
  require 'rspec'
  require 'pry'
  attr_reader :xcoord, :ycoord

  def initialize
    @xcoord = 0,
    @ycoord = 0
  end

  def print_header
    puts 'ABCDEFG'
  end

  def fill_board
    i = 0
    matrix = Array.new(7) { Array.new(7, '.') }
    matrix.each do |sub|
      sub.each do |coord|
      print coord
      i += 1
      if (i == 7)
        puts ''
        i = 0
      end
    end
  end

  end



end
