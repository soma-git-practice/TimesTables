p def hoge
  puts 'hoge'
end
#=> :hoge


pom = def pom
  puts 'pom'
end

p pom
#=> :pom


send(:hoge)
#=> hoge