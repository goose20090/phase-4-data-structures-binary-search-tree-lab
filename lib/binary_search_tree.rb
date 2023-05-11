require_relative './node'
require 'byebug'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    node = @root
  
    return nil if node == nil
  
    while node
      return node if node.value == value
  
      if node.value > value
        node = node.left
      else
        node = node.right
      end
    end
  
    nil
  end

  def insert(value)
    new_node = Node.new(value)

    if @root.nil?
      @root = new_node
      return new_node
    else
      current_node = @root

      while true
        if value < current_node.value
          if current_node.left.nil?
            current_node.left = new_node
            return new_node
          else
            current_node = current_node.left
          end
        elsif value > current_node.value
          if current_node.right.nil?
            current_node.right = new_node
            return new_node
          else
            current_node = current_node.right
          end
        else
          # The value is equal to the current node's value, so we don't allow duplicates.
          return nil
        end
      end
    end
  end

end 
