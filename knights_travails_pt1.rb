require_relative "tree_node.rb"
require "byebug"

class KnightPathFinder


    def initialize(position)
        @position = position
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end

    def considered_positions
        @considered_positions
    end

    def build_move_tree
    end
    
    def self.valid_moves(position)
        new_arr = []
        d = [[2,1], [2,-1], [1,2],[1,-2],[-1,-2],[-1,2],[-2,1],[-2,-1]]
        #debugger
        d.each do |subarr|
            subarr[0] += position[0]
            subarr[1] += position[1]
            if KnightPathFinder.valid_pos?(subarr)
                new_arr << subarr
            end
        end
        new_arr
    end

    def self.valid_pos?(position)
        if position[0] < 0 || position[0] > 7
            return false
        elsif position[1] < 0 || position[1] > 7
            return false
        end
        true
    end

    def new_move_positions(position)
        moves = KnightPathFinder.valid_moves(position)
        moves.each do |move|
            @considered_positions << move
            PolyTreeNode.new(move)
        end

        if moves.include?(@considered_positions)
            moves -= @considered_positions
        end
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            # current_node = queue.first
            # next_positions = current_node.new_move_positions(current_node.value)
            # (0...next_positions.length).each do |i|
            #     new_child = current_node.add_child(PolyTreeNode.new(next_positions[i]))
            #     queue.push(new_child)
            # end
            # queue.shift(current_node)
        end

    end

end

path_1 = KnightPathFinder.new([0,0])
path_1.build_move_tree
