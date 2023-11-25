require_relative '../chart'

RSpec.describe TimesTables do
  one_digit    = TimesTables.new(3)
  double_digit = TimesTables.new(5)
  third_digit  = TimesTables.new(10)

  context '0埋め' do
    it '桁' do
      expect(one_digit.instance_variable_get(:@digit)).to eq     1
      expect(double_digit.instance_variable_get(:@digit)).to eq  2
      expect(third_digit.instance_variable_get(:@digit)).to eq   3
    end
    it '動作' do
      expect(one_digit.filled_with_zero(2)).to eq     '2'
      expect(double_digit.filled_with_zero(2)).to eq  '02'
      expect(third_digit.filled_with_zero(2)).to eq   '002'
    end
  end

  context 'かける数' do
    it '動作' do
      expect(one_digit.generate_row).to eq     '|0|1|2|3|'
      expect(double_digit.generate_row).to eq  '|00|01|02|03|04|05|'
      expect(third_digit.generate_row).to eq   '|000|001|002|003|004|005|006|007|008|009|010|'
    end
  end
  context 'かけられる数' do
    it '動作' do
      expect(one_digit.generate_content).to eq     "|1|1|2|3|\n|2|2|4|6|\n|3|3|6|9|"
      expect(double_digit.generate_content).to eq  "|01|01|02|03|04|05|\n|02|02|04|06|08|10|\n|03|03|06|09|12|15|\n|04|04|08|12|16|20|\n|05|05|10|15|20|25|"
      expect(third_digit.generate_content).to eq   "|001|001|002|003|004|005|006|007|008|009|010|\n|002|002|004|006|008|010|012|014|016|018|020|\n|003|003|006|009|012|015|018|021|024|027|030|\n|004|004|008|012|016|020|024|028|032|036|040|\n|005|005|010|015|020|025|030|035|040|045|050|\n|006|006|012|018|024|030|036|042|048|054|060|\n|007|007|014|021|028|035|042|049|056|063|070|\n|008|008|016|024|032|040|048|056|064|072|080|\n|009|009|018|027|036|045|054|063|072|081|090|\n|010|010|020|030|040|050|060|070|080|090|100|"
    end
  end
  context '表' do
    it '動作' do
      expect(one_digit.generate_table).to eq     "|0|1|2|3|\n|1|1|2|3|\n|2|2|4|6|\n|3|3|6|9|"
      expect(double_digit.generate_table).to eq  "|00|01|02|03|04|05|\n|01|01|02|03|04|05|\n|02|02|04|06|08|10|\n|03|03|06|09|12|15|\n|04|04|08|12|16|20|\n|05|05|10|15|20|25|"
      expect(third_digit.generate_table).to eq   "|000|001|002|003|004|005|006|007|008|009|010|\n|001|001|002|003|004|005|006|007|008|009|010|\n|002|002|004|006|008|010|012|014|016|018|020|\n|003|003|006|009|012|015|018|021|024|027|030|\n|004|004|008|012|016|020|024|028|032|036|040|\n|005|005|010|015|020|025|030|035|040|045|050|\n|006|006|012|018|024|030|036|042|048|054|060|\n|007|007|014|021|028|035|042|049|056|063|070|\n|008|008|016|024|032|040|048|056|064|072|080|\n|009|009|018|027|036|045|054|063|072|081|090|\n|010|010|020|030|040|050|060|070|080|090|100|"
    end
  end
end