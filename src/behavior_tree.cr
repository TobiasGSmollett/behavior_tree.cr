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


class Hello < BehaviorTree::Node::Node(Nil, String)
  def run(a, b)
    puts "#{b}"
    true
  end
end

# example
seq = BehaviorTree::Node::Sequence(Nil, String).new
seq << Hello.new
seq << Hello.new
seq << Hello.new
bt = BehaviorTree::BehaviorTree(Nil, String).new(nil, seq)
bt.run("hello")