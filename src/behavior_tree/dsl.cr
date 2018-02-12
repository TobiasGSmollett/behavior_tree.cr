require "../*"
require "./node/*"

module BehaviorTree::DSL(State)
  def behavior_tree(initial_state, root_node)
    BehaviorTree(State).new(initial_state, root_node)
  end
  
  def action(name : String, &block : State -> Bool)
    Node::Action(State).new(name, block).as(Node::Node(State))
  end
  
  def sequence(name : String, children : Array(Node::Node(State)))
    Node::Sequence(State).new children
  end
  
  def selector(name : String, children : Array(Node::Node(State)))
    Node::Selector(State).new children
  end
end