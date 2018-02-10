module BehaviorTree::Node
  class Selector(State) < BehaviorTree::Node(State)
    
    @children : Array(BehaviorTree::Node)
    
    def initialize(@children = [] of BehaviorTree::Node)
    end
    
    def <<(child : BehaviorTree::Node)
      @children << child
    end
    
    def run(tree : BehaviorTree::BehaviorTree) :: Boolean
      state = tree.state.dup
      @children.each do |child|
        return false if !child.run(state)
      end
      tree.state = state
      true
    end
  end
end