require "./behavior_tree/*"

include BehaviorTree::Node
include BehaviorTree::DSL(Nil, String)

puts_action = 
  action "Puts" do |state, command|
    puts "#{command}"
    true
  end

behavior_tree(nil,
  sequence "seq", [
    puts_action,     
    puts_action, 
    puts_action, 
  ] of Node(Nil, String)
).run("hello")