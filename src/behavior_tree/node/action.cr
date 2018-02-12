require "./*"

module BehaviorTree::Node
  class Action(State, Effect) < Node(State, Effect)
    @name : String
    @action : State -> {Bool, Effect}
    
    def initialize(@name, @action)
    end
    
    def run(state : State) : {Bool, Array({String, Effect})}
      success?, effect = @action.call(state)
      {success?, [{@name, effect}]}
    end
  end
end