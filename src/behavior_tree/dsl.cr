require "../*"
require "./node/*"

module BehaviorTree::DSL(State, Effect)
  def behavior_tree(initial_state, root_node)
    BehaviorTree(State, Effect).new(initial_state, root_node)
  end
  
  def action(name : String, &block : State -> {Bool, Effect})
    Node::Action(State, Effect).new(name, block).as(Node::Node(State, Effect))
  end
  
  def conditional(
    predicate : State -> Bool, 
    success : Node::Node(State, Effect), 
    failure : Node::Node(State, Effect)
  )
    Node::Conditional(State, Effect).new(predicate, success, failure)
  end
  
  def sequence(children : Array(Node::Node(State, Effect)))
    Node::Sequence(State, Effect).new children
  end
  
  def selector(children : Array(Node::Node(State, Effect)))
    Node::Selector(State, Effect).new children
  end
end