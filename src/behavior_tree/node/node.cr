module BehaviorTree::Node
  alias All = Selector(State, Command) | Sequence(State, Command) | Action(State, Command)
  
  abstract class Node(State, Command)
    abstract def run(state : State, command : Command) : Bool
  end
end