module BehaviorTree::Node
  class Selector(State, Command) < BehaviorTree::Node(State, Command)

    @children : Array(BehaviorTree::Node)

    def initialize(@children = [] of BehaviorTree::Node)
    end
    
    def <<(child : BehaviorTree::Node)
      @children << child
    end
    
    def run(state : State, command : Command) :: Boolean
      @children.each do |child|
        local_state = state.dup
        if child.run(local_state, command)
          tree.state = local_state
          return true
        end
      end
      false
    end
  end
end