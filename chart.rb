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
        result << "#{filled_with_zero(item)}"
      end
    end
    
    # 内容
    def generate_content
      (1..@steps).map do |title|
        (1..@steps).inject('|') do |result, index|
          result + filled_with_zero(title*index) + "|"
        end
      end
    end
    
    # 見出し + 内容
    # これと迷った。generate_title.zip(generate_content).map(&:join).join("\n")
    content_arr =
    generate_title.map.with_index do |title, index|
    "|" + title + generate_content[index]
    end
    content_arr.join("\n")
  end

  def return_all
    "#{return_title}\n#{return_content}"
  end
end

puts TimesTables.new(9).return_all