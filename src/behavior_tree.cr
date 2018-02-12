require "./behavior_tree/*"
require "./behavior_tree/node/*"

module BehaviorTree
  
  def new(state : State)
    BehaviorTree::BehaviorTree(State, Object).new(state)
  end
  
  class BehaviorTree(State, Effect)
    property root : Node::Node(State, Effect)
    property state : State
    
    def initialize(@state, @root)
    end
    
    def run
      success?, effects = @root.run(@state)
      effects
    end
  end
end
