require "csv"

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
      csv << ['段', *( steps_array.map{|item| "#{item}の位" } )]
      dan_array.each{|item| csv << item }
    end
  end

  class << self
    # インポートして情報を元にインスタンスを作成して、表や位、段を表示する作戦
    def import_csv(file_path = 'import.csv')
      # まずはファイルの読み込み
      CSV.open(file_path, 'r', headers: true, return_headers: true) do |row|
        # 
      end
    end
  end
end

puts TimesTables.import_csv('hoge.csv')