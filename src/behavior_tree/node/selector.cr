require "./*"

module BehaviorTree::Node
  class Selector(State) < Node(State)
    
    @children : Array(Node(State))

    def initialize(@children = [] of Node(State))
    end
    
    def <<(child : Node(State))
      @children << child
    end
    
    def run(state : State) : Bool
      @children.each do |child|
        local_state = state.dup
        if child.run(local_state)
          state = local_state
          return true
        end
      end
      false
    end
  end
end