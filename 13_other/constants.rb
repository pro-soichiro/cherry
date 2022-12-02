# 環境変数はENVという組み込み定数に格納される。ハッシュ

name = ENV['MY_NAME']

# 起動時引数はARGVという組み込み定数に格納される。配列

email = ARGV[0]
age = ARGV[1]


puts "name: #{name}, email: #{email}, age: #{age}"

=begin

# 下記のコマンドで環境変数の設定

export MY_NAME=Alice
export 変数名=値


# 下記のコマンドで起動時引数の設定が可能

ruby constants.rb alice@example.com 20
ruby ファイルパス 起動時引数

=end


# そのほかの組み込み定数


## 標準出力

STDOUT
# => #<IO:<STDOUT>>


## Rubyのバージョン

RUBY_VERSION
# => "2.6.10"

binding.irb

