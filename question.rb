module Shuffle
  def shuffle
    chars.shuffle.join
  end
end

alice = "Alice"
alice.extend Shuffle

p alice.shuffle