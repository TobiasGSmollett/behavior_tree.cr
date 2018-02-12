require "./behavior_tree/*"

include BehaviorTree
include BehaviorTree::DSL(Nil, Nil)

puts_action = 
  action "Puts" do |state|
    puts "hello"
    {true, nil}
  end

predicate = ->(state : Nil){ false }

success = 
  action "Puts" do |state|
    puts "true"
    {true, nil}
  end
  
failure = 
  action "Puts" do |state|
    puts "false"
    {true, nil}
  end
    
result =
behavior_tree(nil,
  sequence [
    puts_action,     
    puts_action, 
    puts_action, 
    conditional(predicate, success, failure),
  ]
).run()

puts result