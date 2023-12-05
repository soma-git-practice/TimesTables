require_relative '../chart_2'

RSpec.describe '九九表' do
  let(:tables){ TimesTables.new(steps: 5, mark: '|') }

  it '初期値（段数）を取得する' do
    expect(tables.steps).to eq 5
  end
  
  it '初期値（記号）を取得する' do
    expect(tables.steps).to eq 5
  end

  describe '引数 ~ 段数までの配列を作成する' do
    it '0 ~ 引数' do
      expect(tables.arg_to_steps_array(0)).to eq [0, 1, 2, 3, 4, 5]
    end
    it '1 ~ 引数' do
      expect(tables.arg_to_steps_array(1)).to eq [1, 2, 3, 4, 5]
    end
  end

  it '0埋めをする' do
    expect(tables.filled_with_zero(3)).to eq '03'
  end

  it '数字の配列を作成する' do
    expect(tables.integer_array(0)).to eq ['00', '01', '02', '03', '04', '05']
  end

  it '配列を記号で挟む' do
    expect(tables.wrap_array_with_mark([1, 2, 3])).to eq '|1|2|3|'
  end

  it '九九表の一段目の作成' do
    expect(tables.total).to eq '|00|01|02|03|04|05|'
  end
end