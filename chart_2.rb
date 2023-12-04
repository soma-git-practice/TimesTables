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
  # 段数
  @steps = 5
  # 記号
  @mark = '|'

  # 0 ~ 段数までの配列の作成・・・arg_to_steps_array(0)
  # 1 ~ 段数までの配列の作成・・・arg_to_steps_array(1)
  def self.arg_to_steps_array(start_point)
    [*start_point..@steps]
  end

  # 数字配列
  def self.integer_array(integer)
    arg_to_steps_array(integer)
  end

  @nums = self.integer_array(0)
  @nums_size = @nums.size

  # 記号配列
  def self.mark_array(integer)
    arg_to_steps_array(integer).push('last_string').map{ @mark }
  end

  @marks = self.mark_array(0)
  @marks_size = @marks.size

  def self.mix_array
    @mix_size = @nums_size + @marks_size
    mix_array = []
  end

end

p TimesTables.mix_array