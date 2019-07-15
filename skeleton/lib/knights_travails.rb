require 'byebug'
require_relative "00_tree_node.rb"

class KnightPathFinder
  attr_reader :board, :root_node

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @board = Array.new(8) {Array.new(8)}
    @considered_positions = []
    generate_board 
  end

  def generate_board
    @board.each_with_index do |row, row_idx|
      row.each_with_index do |el, el_idx|
        @board[row_idx][el_idx] = PolyTreeNode.new([row_idx, el_idx])
      end
    end
  end



  def valid_moves(start_pos)
    row, col = start_pos
    possible_moves = [
      [row-2, col-1],
      [row-2, col+1],
      [row-1, col-2],
      [row-1, col+2],
      [row+1, col-2],
      [row+1, col+2],
      [row+2, col-1],
      [row+2, col+1]
    ]
    valid_moves = []
    possible_moves.select do |pos| 
      if pos[0] >= 0 && pos[1] >= 0 && pos[0] < 8 && pos[1] < 8
        valid_moves << pos
      end
    end
    valid_moves

  end

  def build_move_tree(start_pos=nil, end_pos)
    paths = []
    debugger
    start_pos = @root_node.value
    if self.valid_moves(start_pos).include?(end_pos)
      path << [start_pos, end_pos]
      return paths
    else
      self.valid_moves(start_pos).each do |potential_pos|
        paths << build_move_tree(potential_pos, end_pos)
      end
    end

  end


  def find_path(end_pos)

  end



end


kpf = KnightPathFinder.new([0, 0])



kpf.find_path([2, 1]) # => [[0, 0], [2, 1]]
kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]

