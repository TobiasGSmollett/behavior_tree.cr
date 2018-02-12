require "./*"

module BehaviorTree::Node
  class Action(State) < Node(State)
    
    @action : State -> Bool
    
    getter name : String
    
    def initialize(@name, @action)
    end
    
    def run(state : State) : Bool
      @action.call(state)
    end
  end
end