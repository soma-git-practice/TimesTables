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

require "csv"

class TimesTables
  attr_reader :steps, :mark, :steps_array, :zero_flg

  CSV_EXPORT_FILEPATH = 'chart_2_export.csv'

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
    return integer unless @zero_flg
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
  def kurai_array
    # 0埋めをした、「0 ~ 段数」の配列
    value = arg_to_steps_array(0)
    value = value.map{|n| filled_with_zero(n)}
  end

  # 段の行
  def dan_array
    @steps_array.map do |dan|
      # 段を表す指標
      index = [ filled_with_zero(dan) ]
      # 計算
      main = @steps_array.map do |kurai|
              # 値 = 段 * 位
              value = dan * kurai
              # 値を0埋めする
              filled_with_zero value
            end
      index + main
    end
  end

  def generate_table
    items = [kurai_array, *dan_array]
    items = items.map { |array| wrap_array_with_mark array }
    items.join("\n")
  end

  def export_csv
    CSV.open(CSV_EXPORT_FILEPATH, 'w') do |csv|
      csv << ['位', *steps_array]
      dan_array.each{|item| csv << item }
    end
  end
end
