class User
  def initialize
    @hello = '0'
  end
  @test  = '1'
  @@hoge = '2'
end

# Userクラスのインスタンスメソッド
p User.new.instance_variables             #=> [:@hello]
p User.new.instance_variable_get(:@hello) #=> 0

# Objectクラスのインスタンスメソッド
p User.instance_variables            #=> [:@test]
p User.instance_variable_get(:@test) #=> 1

# Moduleクラスのインスタンスメソッド
p User.class_variables             #=> [:@@hoge]
p User.class_variable_get(:@@hoge) #=> 2

# クラス、モジュールのスーパークラスとインクルードしているモジュールを優先順位順に配列に格納して返す
# p User.new.ancestors   #=> undefined method ancestors 
p User.ancestors         #=> [User, Object, Kernel, BasicObject]
p Module.ancestors       #=> [Module, Object, Kernel, BasicObject]