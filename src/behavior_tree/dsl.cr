require "../*"
require "./node/*"

module BehaviorTree::DSL(State, Command)
  def behavior_tree(initial_state, root_node)
    BehaviorTree(State, Command).new(initial_state, root_node)
  end
  
  def action(name : String, &block : State, Command -> Bool)
    Node::Action(State, Command).new(block).as(Node::Node(State, Command))
  end
  
  def sequence(name : String, children : Array(Node::Node(State, Command)))
    Node::Sequence(State, Command).new children
  end
  
  def selector(name : String, children : Array(Node::Node(State, Command)))
    Node::Selector(State, Command).new children
  end
end