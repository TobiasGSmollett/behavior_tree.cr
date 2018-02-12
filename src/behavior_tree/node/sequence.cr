require "./*"

module BehaviorTree::Node
  class Sequence(State, Effect) < Node(State, Effect)
    
    @children : Array(Node(State, Effect))

    def initialize(@children = [] of Node(State, Effect))
    end
    
    def <<(child : Node(State))
      @children << child
    end
    
    def run(state : State) : {Bool, Array({String, Effect})}
      local_state = state.dup
      all_effects = @children.map do |child|
        success?, effects = child.run(local_state)
        return {false, [] of {String, Effect}} if !success?
        effects
      end
      state = local_state
      {true, all_effects.flatten}
    end
  end
end