require "./behavior_tree/*"
require "./behavior_tree/node/*"

module BehaviorTree
  
  def new(state : State)
    BehaviorTree::BehaviorTree(State).new(state)
  end
  
  class BehaviorTree(State)
    property root : Node::Node(State)
    property state : State
    
    def initialize(@state, @root)
    end
    
    def run
      @root.run(@state) if !@root.nil?
    end
  end
end
