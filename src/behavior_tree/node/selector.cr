module BehaviorTree::Node
  class Selector(State) < BehaviorTree::Node(State)

    @children : Array(BehaviorTree::Node)

    def initialize(@children = [] of BehaviorTree::Node)
    end
    
    def <<(child : BehaviorTree::Node)
      @children << child
    end
    
    def run(tree : BehaviorTree::BehaviorTree) :: Boolean
      @children.each do |child|
        state = tree.state.dup
        if child.run(state)
          tree.state = state
          return true
        end
      end
      false
    end
  end
end