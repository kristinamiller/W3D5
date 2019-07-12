require "byebug"

class PolyTreeNode

  attr_reader :value, :parent, :children 
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent = node
    node.children << self if node and !node.children.include?(self)
    if node && !node.parent.nil? 
      node.parent.children.delete(self)
    end
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    if self.children.include?(node)
      node.parent = nil 
    else
      raise error 
    end
  end

  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      search_result = child.dfs(target)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(target)
    return self if self.value == target
    queue = []
    queue << self 
    visited = []
    visited << self 
    until queue.empty? 
      current_node = queue.shift 
      current_node.children.each do |child|
        next if visited.include?(child)
        queue << child 
        visited << child
        return child if child.value == target 
      end
    end
    nil 
  end


end