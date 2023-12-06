require 'pry'

# activesupport/lib/active_support/core_ext/array/access.rb
# 面白そう

class Array
  def from(position)
    self[position, length] || []
  end

  def to(position)

  end
end

p %w( a b c d ).from(2)