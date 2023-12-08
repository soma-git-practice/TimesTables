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

require 'pry'

class TimesTables
  attr_reader :steps, :mark, :steps_array

  def initialize(steps: 5, mark: '|', zero_flg: true)
    # 段数
    @steps = steps
    # 記号
    @mark  = mark
    # 0埋めで使うフラグ
    @zero_flg = zero_flg
    # 段の配列
    @steps_array = arg_to_steps_array(1)
  end


  #### 部品メソッド

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

  # 記号で挟む
  def wrap_array_with_mark(array)
    # 補足 [1,2,3] * '|' = '1|2|3'
    @mark + array * @mark + @mark
  end


  ### 組み立てメソッド

  # 位の行
  def kurai_string
    # 0埋めをした、「0 ~ 段数」の配列
    value = arg_to_steps_array(0)
    value = value.map{|n| filled_with_zero(n)} if @zero_flg
    # 記号で囲む
    wrap_array_with_mark(value)
  end

  # 段の行
  def dan_string
    result = @steps_array.map do |dan|
              # 段を表す指標
              index = dan
              index = filled_with_zero(index) if @zero_flg
              index = [ index ]
              # 計算
              main = @steps_array.map do |kurai|
                      # 値 = 段 * 位
                      value = dan * kurai
                      # 値を0埋めする
                      value = filled_with_zero value if @zero_flg
                      value
                    end
              row = index + main
              # 記号で囲む
              wrap_array_with_mark( row )
            end
    # 文字列に変換
    result.join("\n")
  end

  def generate_table
    [kurai_string, dan_string].join("\n")
  end
end