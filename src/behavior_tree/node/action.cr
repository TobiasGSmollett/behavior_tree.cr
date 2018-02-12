require "./*"

module BehaviorTree::Node
  class Action(State, Effect) < Node(State, Effect)
    
    @action : State -> {Bool, Effect}
    
    getter name : String
    
    def initialize(@name, @action)
    end
    
    def run(state : State) : {Bool, Array(Effect)}
      success?, effect = @action.call(state)
      {success?, [effect]}
    end
  end
end