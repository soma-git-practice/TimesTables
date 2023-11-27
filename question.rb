class Product
  @@hoge = 'ほげ'

  def self.hoge
    p @@hoge
  end

  def hoge
    p @@hoge
  end
end

class DVD < Product
  def self.hoge
    p @@hoge
  end

  def hoge
    p @@hoge
  end
end

Product.hoge
Product.new.hoge
DVD.hoge
DVD.new.hoge