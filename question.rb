class Product
  def self.hoge
    p @@hoge
  end
  @@hoge = "わー"
end

class DVD < Product
  def self.hoge
    p @@hoge
  end
  @@hoge = "上書きした"
end

Product.hoge #=> 上書きした
DVD.hoge     #=> 上書きした



class Product2
  def self.hoge
    p @@hoge
  end
  @@hoge = "わー"
end

class DVD2 < Product2
  def self.hoge
    p @@hoge
  end
end

Product2.hoge #=> わー
DVD2.hoge     #=> わー

###################################
# ここまでの動きから、
# 上流で定義したクラス変数は、
# 下流で共有して使われていることが分かる。
###################################

class World
  def self.hoge
    p @@hoge
  end
end

class Japan < World
  def self.hoge
    p @@hoge
  end
  @@hoge = "japan"
end

World.hoge #=> uninitialized class variable @@hoge in World
Japan.hoge



class World2
  def self.hoge
    p @@hoge
  end
end

class Japan2 < World2
  def self.hoge
    p @@hoge
  end
  @@hoge = "japan2"
end

Japan2.hoge #=> japan2
World2.hoge #=> uninitialized class variable @@hoge in World2

###################################
# ここまでの動きから、
# 下流で初めて定義したクラス変数は、
# 上流には共有されないことが分かる。
###################################