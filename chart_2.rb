# 九九表
class TimesTables < String
  def initialize(integer)
    # 段
    @steps = integer
    # 段*段の桁数を取得
    @digit = calculate_digit integer**2
  end

  # 桁計算
  def calculate_digit(integer)
    integer.to_s.size
  end

  # 0埋め
  def filled_with_zero(integer)
    format("%0#{@digit}d", integer)
  end
  
  # 1 ~ n回の繰り返し
  def from_one_to_n_loop(n, &block)
    (1..n).map{|index| block.call index }
  end

  # 記号で挟む
end