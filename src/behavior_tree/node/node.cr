module BehaviorTree::Node  
  
  abstract class Node(State, Effect)
    abstract def run(state : State) : {Bool, Array({String, Effect})}
  end
end