require "./behavior_tree/*"

include BehaviorTree
include BehaviorTree::DSL(Nil, Nil)

puts_action = 
  action "Puts" do |state|
    puts "hello"
    {true, nil}
  end

result =
behavior_tree(nil,
  sequence "seq", [
    puts_action,     
    puts_action, 
    puts_action, 
  ]
).run()

puts result