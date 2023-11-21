# frozen_string_literal: true

# タイトル
# ->九九の表を出力するぞ

# 補足
# ->引数の数に応じて増幅！
# ->検索にヒットしたら、該当箇所を色付けする！

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

# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

# ーーーーーーーーーーーーーーーー
# 一応動く
# ーーーーーーーーーーーーーーーー

# def double_digit(arg)
#   "%03d" % arg
# end

# def ch(int)
#   int.integer?

#   # 初期
#   total = String.new("|")
#   (int + 1).times do |arg|
#     total += double_digit(arg) + "|"
#   end
#   puts total

#   int.times do |arg|
#     arg += 1
#     local = double_digit(arg)
#     total = String.new("|#{local}|")
#     int.times do |n|
#       total += (double_digit(arg * (n + 1))).to_s + "|"
#     end
#     puts total
#   end
# end

# ch(10)

# ーーーーーーーーーーーーーーーー
# 途中
# ーーーーーーーーーーーーーーーー

# 九九表
class TimesTables
  def initialize(arg)
    # 段
    @steps = arg
    # 段*段の桁数を取得
    @digit = (@steps**2).to_s.size
  end

  # 0埋め
  def filled_with_zero(arg)
    format("%0#{@digit}d", arg)
  end

  # かける数
  def return_title
    (0..@steps).inject('|') do |result, item|
      "#{result + filled_with_zero(item)}|"
    end
  end

  # かけられる数
  def return_content
    # 見出し
    def generate_title
      (1..@steps).inject([]) do |result, item|
        result << "|#{filled_with_zero(item)}|"
      end
    end
    # 内容
    # arry = []
    # (1..@steps).each do |item|
    #   arry << (1..@steps).inject(generate_title[item - 1]) do |result, block|
    #     "#{result + filled_with_zero(item * block)}|"
    #   end
    # end
    # arry.join("\n")
    
    # 内容
    def generate_content
      (1..@steps).map do |item|
        
      end
    end
    
    # 見出し + 内容
    generate_content
  end

  def return_all
    "#{return_title}\n#{return_content}"
  end
end

p TimesTables.new(5).return_content
