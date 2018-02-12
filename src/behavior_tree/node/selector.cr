require "./*"

module BehaviorTree::Node
  class Selector(State, Effect) < Node(State, Effect)
    
    @children : Array(Node(State, Effect))

    def initialize(@children = [] of Node(State, Effect))
    end
    
    def <<(child : Node(State))
      @children << child
    end
    
    def run(state : State) : {Bool, Array({String, Effect})}
      @children.each do |child|
        local_state = state.dup
        success?, effects = child.run(local_state)
        if success?
          state = local_state
          return {true, effects}
        end
      end
      {false, [] of {String, Effect}}
    end
  end
end