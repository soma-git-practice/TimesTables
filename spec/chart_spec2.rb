require_relative '../chart_2'

RSpec.describe TimesTables do
  let(:tables){ TimesTables.new(steps: 4, mark: '|', zero_flg: zero_flg) }

  context '共通部分' do
    let(:zero_flg){ true }
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
      
      it '0埋めの取得' do
        expect(tables.zero_flg).to be true
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

      it '配列を記号で挟む' do
        expect(tables.wrap_array_with_mark([1, 2, 3])).to eq '|1|2|3|'
      end
    end
  end

  context '0埋めする場合' do
    let(:zero_flg){ true }
    it 'filled_with_zero' do
      expect(tables.filled_with_zero(3)).to eq '03'
    end
    
    it 'kurai_array' do
      expect(tables.kurai_array).to eq ['00','01','02','03','04']
    end
    
    it 'dan_array' do
      expect(tables.dan_array).to eq [['01', '01', '02','03', '04'], ['02', '02', '04', '06', '08'], ['03', '03', '06', '09', '12'], ['04', '04', '08', '12', '16']]
    end
    
    it 'generate_table' do
      expect(tables.generate_table).to eq "|00|01|02|03|04|\n|01|01|02|03|04|\n|02|02|04|06|08|\n|03|03|06|09|12|\n|04|04|08|12|16|"
    end

    it 'export_csv' do
      test_path = 'spec/test_export.csv'
      # エクスポート
      tables.export_csv( test_path )
      # ファイル内の情報のテスト
      CSV.open(test_path, 'r') do |csv|
        expect(csv.readline).to eq ["段", "1の位", "2の位", "3の位", "4の位"]
        expect(csv.readline).to eq ["01", "01", "02", "03", "04"]
        expect(csv.readline).to eq ["02", "02", "04", "06", "08"]
        expect(csv.readline).to eq ["03", "03", "06", "09", "12"]
        expect(csv.readline).to eq ["04", "04", "08", "12", "16"]
      end
      # テストで使用したファイルの削除
      File.delete( test_path )
    end
  end
  
  context '0埋めしない場合' do
    let(:zero_flg){ false }
    it 'filled_with_zero' do
      expect(tables.filled_with_zero(3)).to eq 3
    end
    
    it 'kurai_array' do
      expect(tables.kurai_array).to eq [0, 1, 2, 3, 4]
    end
    
    it 'dan_array' do
      expect(tables.dan_array).to eq [[1, 1, 2, 3, 4], [2, 2, 4, 6, 8], [3, 3, 6, 9, 12], [4, 4, 8, 12, 16]]
    end
    
    it 'generate_table' do
      expect(tables.generate_table).to eq "|0|1|2|3|4|\n|1|1|2|3|4|\n|2|2|4|6|8|\n|3|3|6|9|12|\n|4|4|8|12|16|"
    end

    it 'export_csv' do
      test_path = 'spec/test_export.csv'
      # エクスポート
      tables.export_csv( test_path )
      # ファイル内の情報のテスト
      CSV.open(test_path, 'r') do |csv|
        expect(csv.readline).to eq ["段", "1の位", "2の位", "3の位", "4の位"]
        expect(csv.readline).to eq ["1", "1", "2",  "3",  "4"]
        expect(csv.readline).to eq ["2", "2", "4",  "6",  "8"]
        expect(csv.readline).to eq ["3", "3", "6",  "9", "12"]
        expect(csv.readline).to eq ["4", "4", "8", "12", "16"]
      end
      # テストで使用したファイルの削除
      File.delete( test_path )
    end
  end
end