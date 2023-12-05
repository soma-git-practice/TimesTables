# |00|01|02|03|04|05|06|07|08|09|
# |01|01|02|03|04|05|06|07|08|09|
# |02|02|04|06|08|10|12|14|16|18|
# |03|03|06|09|12|15|18|21|24|27|
# |04|04|08|12|16|20|24|28|32|36|
# |05|05|10|15|20|25|30|35|40|45|
# |06|06|12|18|24|30|36|24|48|54|
# |07|07|14|21|28|35|42|49|64|63|
# |08|08|16|24|32|40|48|42|64|72|
# |09|09|18|27|36|45|30|63|72|81|

# 0埋め
# 桁の増減
# 区切り文字

class TimesTables
  attr_reader :steps, :mark, :steps_array

  def initialize(steps: 5, mark: '|')
    # 段数
    @steps = steps
    # 記号
    @mark  = mark
    # 段の配列
    @steps_array = arg_to_steps_array(1)
  end
  

  #### パーツ

  # 0 ~ 段数までの配列の作成・・・arg_to_steps_array(0)
  # 1 ~ 段数までの配列の作成・・・arg_to_steps_array(1)
  def arg_to_steps_array(start_point = 0)
    [*start_point..@steps]
  end

  # 0埋め
  def filled_with_zero(integer)
    max_number_digit = @steps.pow(2).to_s.size
    "%0#{ max_number_digit }d" % integer
  end

  # 数字配列
  def integer_array(integer = 0)
    arg_to_steps_array(integer).map{|n| filled_with_zero(n)}
  end
  
  # 記号で挟む
  def wrap_array_with_mark(array)
    # 補足 [1,2,3] * '|' = '1|2|3'
    @mark + array * @mark + @mark
  end


  ### 組み立て

  def first_step_array
    [ wrap_array_with_mark(integer_array) ]
  end

  def rest_steps_array
    # 縦列用のループ
    @steps_array.map do |index|
      # 横列用のループ
      header = [ filled_with_zero(index) ]
      main = @steps_array.map do |n|
              calculate = index * n
              filled_with_zero calculate
            end
      wrap_array_with_mark( header + main )
    end
  end

  def generate_table
    first_step_array.concat(rest_steps_array).join("\n")
  end
end

puts TimesTables.new(steps: 9).generate_table