module BehaviorTree::Node  
  
  abstract class Node(State, Command)
    abstract def run(state : State, command : Command) : Bool
  end
end