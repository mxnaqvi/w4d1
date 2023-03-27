class PolyTreeNode
    attr_reader :value, :children, :parent
  def initialize(value)
    @parent = nil
    @children =  []
    @value = value
  end

#   def value 

  def parent=(new_parent)

    if @parent == nil
        @parent = new_parent
        @parent.children << self if !@parent.children.include?(self)
    elsif 
        old_child = @parent.children.delete(self)
        @parent = new_parent
        @parent.children << old_child if new_parent != nil
    end
  end

  def add_child(child_node)
    child_node.parent=self
  end
  
  def remove_child(child_node)
    child_node.parent=nil
  end
require 'byebug'
  def dfs(target)
    return self if self.value == target
    self.children.each do |child|
      next_child = child.dfs(target)
      if !next_child.nil?
        return next_child
      end
    end
    return nil 
  end

  def inspect
    @value.inspect
  end

require "byebug"
  def bfs(target)
    queue = []
    queue.push(self)

    until queue.empty?
      if queue.empty?
        return nil
      elsif queue.first.value == target
        return queue.first
      else
        queue.concat(queue.first.children)
        queue.shift
      end
    end

  end

end