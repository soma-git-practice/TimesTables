class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  @name = '書き換えました'
end

user = User.new('Bob')
puts user.name
#=> 'Bob'