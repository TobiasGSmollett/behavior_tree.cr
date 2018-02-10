module BehaviorTree
  class Node(State, Command)
    abstract def run(state : State, command : Command) :: Boolean    
  end
end