require "./behavior_tree/*"

include BehaviorTree
include BehaviorTree::DSL(Nil)

puts_action = 
  action "Puts" do |state|
    puts "hello"
    true
  end

behavior_tree(nil,
  sequence "seq", [
    puts_action,     
    puts_action, 
    puts_action, 
  ]
).run()