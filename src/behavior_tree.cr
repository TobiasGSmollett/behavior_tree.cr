require "./behavior_tree/*"

module BehaviorTree
  class BehaviorTree(State, Command)
    @root : BehaviorTree::Node(State, Command) | Nil
    property state : State
    
    def initialize(@state)
      @root = nil
    end
    
    def run(command : Command)
      @root.run() if !@root.nil?
    end
  end
end

