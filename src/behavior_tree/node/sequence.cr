module BehaviorTree::Node
  class Selector(State, Command) < BehaviorTree::Node(State, Command)
    
    @children : Array(BehaviorTree::Node)
    
    def initialize(@children = [] of BehaviorTree::Node)
    end
    
    def <<(child : BehaviorTree::Node)
      @children << child
    end
    
    def run(state : State, command : Command) :: Boolean
      local_state = state.dup
      @children.each do |child|
        return false if !child.run(local_state, command)
      end
      tree.state = local_state
      true
    end
  end
end