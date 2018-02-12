module BehaviorTree::Node  
  
  abstract class Node(State)
    abstract def run(state : State) : Bool
  end
end