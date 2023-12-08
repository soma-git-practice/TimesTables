require_relative '../../chart_2'

RSpec.describe '九九表' do
  let(:tables){ TimesTables.new(steps: 4, mark: '|') }

  describe '初期値' do
    it '段数の取得' do
      expect(tables.steps).to eq 4
    end
  
    it '記号の取得' do
      expect(tables.mark).to eq '|'
    end

    it '段一覧の取得' do
      expect(tables.steps_array).to eq [1, 2, 3, 4]
    end
  end

  describe '部品メソッド' do
    describe '引数 ~ 段数までの配列を作成' do
      it '0 ~ 引数' do
        expect(tables.arg_to_steps_array(0)).to eq [0, 1, 2, 3, 4]
      end
      it '1 ~ 引数' do
        expect(tables.arg_to_steps_array(1)).to eq [1, 2, 3, 4]
      end
    end

    it '0で埋める' do
      expect(tables.filled_with_zero(3)).to eq '03'
    end

    it '配列を記号で挟む' do
      expect(tables.wrap_array_with_mark([1, 2, 3])).to eq '|1|2|3|'
    end
  end

  describe '組み立てメソッド' do
    it '位の行の取得' do
      expect(tables.kurai_string).to eq '|00|01|02|03|04|'
    end

    it '段の行の取得' do
      expect(tables.dan_string).to eq "|01|01|02|03|04|\n|02|02|04|06|08|\n|03|03|06|09|12|\n|04|04|08|12|16|"
    end

    it '表の取得' do
      expect(tables.generate_table).to eq "|00|01|02|03|04|\n|01|01|02|03|04|\n|02|02|04|06|08|\n|03|03|06|09|12|\n|04|04|08|12|16|"
    end
  end

end