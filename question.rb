class User
  attr_reader :hoge
  def initialize
    @hoge = 'デフォルト'
  end
  @hoge = '書き換えました'
end


p User.new.hoge #=> デフォルト
p User.new.instance_variable_get(:@hoge) #=> デフォルト


p User.new #=> <User:~~~~ @hoge="デフォルト">
p User.instance_variable_get(:@hoge) #=> 書き換えました
# p User.hoge #=> undefined method `hoge`
