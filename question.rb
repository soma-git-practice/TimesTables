class User
  @hoge = 'ほげ'

  def self.get_hoge
    puts @hoge
  end

  def self.set_hoge=(hoge)
    @hoge = hoge
    puts @hoge
  end

  def greet(str)
    puts str
  end
end

User.get_hoge
User.set_hoge=('お？いけたか！')

p User.public_methods.grep(/hoge/)
p User.instance_methods.grep(/greet/)