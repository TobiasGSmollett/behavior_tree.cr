require "./behavior_tree/*"
require "./behavior_tree/node/*"

module BehaviorTree  
  
  class BehaviorTree(State, Command)
    property root : Node::Node(State, Command)
    property state : State
    
    def initialize(@state, @root)
    end
    
    def run(command : Command)
      @root.run(@state, command) if !@root.nil?
    end
  end
end
