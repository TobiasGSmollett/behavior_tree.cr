module BehaviorTree
  class Node(State)
    abstract def run(state : State) :: Boolean    
  end
end