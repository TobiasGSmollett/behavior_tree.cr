require "./*"

module BehaviorTree::Node
  class Sequence(State, Command) < Node(State, Command)
    
    @children : Array(Node(State, Command))

    def initialize(@children)
    end
    
    def <<(child : Node(State, Command))
      @children << child
    end
    
    def run(state : State, command : Command) : Bool
      local_state = state.dup
      @children.each do |child|
        return false if !child.run(local_state, command)
      end
      state = local_state
      true
    end
  end
end