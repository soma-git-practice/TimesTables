class User
  @hoge = 'ほげ'
end

puts (User.new).class #=> User
puts User.class       #=> Class

puts (User.new).instance_of?(User) #=> true
puts User.instance_of?(Class) #=> true