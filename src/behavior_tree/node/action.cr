require "./*"

module BehaviorTree::Node
  class Action(State, Command) < Node(State, Command)
    
    @action : State, Command -> Bool
    
    def initialize(@action)
    end
    
    def run(state : State, command : Command) : Bool
      @action.call(state, command)
    end
  end
end