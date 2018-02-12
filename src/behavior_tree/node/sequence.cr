require "./*"

module BehaviorTree::Node
  class Sequence(State) < Node(State)
    
    @children : Array(Node(State))

    def initialize(@children)
    end
    
    def <<(child : Node(State))
      @children << child
    end
    
    def run(state : State) : Bool
      local_state = state.dup
      @children.each do |child|
        return false if !child.run(local_state)
      end
      state = local_state
      true
    end
  end
end