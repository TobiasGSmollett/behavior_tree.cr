# behavior_tree.cr

This library is an implementation of [Behavior Tree](https://github.com/libgdx/gdx-ai/wiki/Behavior-Trees) for Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  behavior_tree:
    github: TobiasGSmollett/behavior_tree.cr
```

## Usage

```crystal
require "behavior_tree"

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
# hello
# hello
# hello
# false
# [{"Puts", nil}, {"Puts", nil}, {"Puts", nil}, {"Puts", nil}]
```

## Contributing

1. Fork it ( https://github.com/[your-github-name]/behavior_tree.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [TobiasGSmollett](https://github.com/TobiasGSmollett) TobiasGSmollett - creator, maintainer
