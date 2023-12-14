require "csv"
require "pry"

class String
  # 半角１文字、全角２文字としてカウント
  def length_ja
    half_length = self.count(" -~|｡-ﾟ|\r|\n")
    full_length = (self.length - half_length) * 2
    half_length + full_length
  end

  def cjust(width, padding=' ')
    # 文字列を半角であれば１。それ以外は２として分けた集合の総和
    output_width = each_char.map{|c| c.bytesize == 1 ? 1 : 2}.reduce(0, &:+)
    # [0, ( 空白+文字 ) - 文字].max
    # エラー防止 -> 文字列 * 負の数 = エラー
    padding_size = [0, width - output_width].max
    _quotient, remainder = padding_size.divmod(2)
    padding * (padding_size/2) + padding * remainder + self + padding * (padding_size/2)
  end
end

class TimesTables
  attr_reader :steps, :mark, :steps_array, :zero_flg

  def initialize(
      steps: 5,
      mark: '|',
      zero_flg: true
    )

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

  # 表の表示
  def generate_table
    items = [kurai_array, *dan_array]
    items = items.map { |array| wrap_array_with_mark array }
    items.join("\n")
  end

  # csv出力
  def export_csv( file_path = 'export.csv' )
    CSV.open(file_path, 'w') do |csv|
      csv << ['段', *( steps_array.map{|item| "#{ item }の位" } )]
      dan_array.each{|item| csv << item }
    end
  end

  class << self

    def wrap_array_with_mark(array, mark: '|')
      mark + array * mark + mark
    end

    def import_csv(file_path = 'import.csv')
      table = CSV.read(file_path)

      # length_ja は、半角１文字、全角２文字で数える
      kurai_last = table[0][-1].length_ja
      dan_last = table[-1][-1].length_ja
      max_length = [kurai_last, dan_last].max

      table.map do |row|
        row = row.map do |cell|
                        # セルを１文字多めに右寄せする
                        cell.cjust(max_length + 2)
                      end
        # 一行を記号で飾る
        wrap_array_with_mark row
      end.join("\n")
    end

  end
end

TimesTables.new(steps: 6, zero_flg: true).export_csv('import.csv')
puts TimesTables.import_csv