# 日時を扱う
=begin
Dateクラスは日付を扱う
TimeクラスとDateTimeクラスは日付と時刻を扱う

Timeクラスだけが組み込みライブラリであるためデフォルトで使用可能
他のクラスはrequireが必要
さらにDateTimeクラスは非水準になっている。

=end


instance_without_time = Time.new(2022, 12, 2)
#=> 2022-12-02 00:00:00 +0900

instance_with_time = Time.new(2022, 12, 2, 23, 50, 30)
#=> 2022-12-02 23:50:30 +0900

require 'date'

date = Date.new(2021, 1, 31)
#=> #<Date: 2021-01-31 ((2459246j,0s,0n),+0s,2299161j)>

# date = Date.new(2021, 1, 31, 12, 45, 00)
# =>  wrong number of arguments (given 6, expected 0..4) (ArgumentError)

=begin
Timeは日付も時間も設定できる
Dateは日付のみ設定できる

Timeクラスのインスタンスの「+0900」とは、
タイムゾーンである。
UTC（世界標準時）から9時間進んでいることを表している。
=end

binding.irb
