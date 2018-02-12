require "./*"

module BehaviorTree::Node
  class Conditional(State, Effect) < Node(State, Effect)
    @predicate : State -> Bool
    @success : Node(State, Effect)
    @failure : Node(State, Effect)
    
    def initialize(@predicate, @success, @failure)
    end
    
    def run(state : State) : {Bool, Array({String, Effect})}
      if @predicate.call(state.dup)
        @success.run(state)
      else
        @failure.run(state)
      end
    end
  end
end