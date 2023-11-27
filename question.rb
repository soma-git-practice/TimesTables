class Product
  def self.hoge
    @@hoge
  end

  def initialize(name)
    @@hoge = name
  end

  def hoge
    @@hoge
  end
end

Product.hoge #=> uninitialized class variable @@hoge