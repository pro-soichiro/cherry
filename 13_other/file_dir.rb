=begin
FileクラスとDirクラスは組み込みライブラリであるため
デフォルトで使用可能。
=end


# カレントディレクトリに"date_time.rb"が存在するか？
result1 = File.exist?('./date_time.rb')
#=> true

result2 = File.exist?('./undefined.rb')
#=> false


=begin
File.open(path, 'action') do |f|
  処理
end

actionは
- rで読み取り
- wで書き込み
=end

# date_time.rbファイルの行数を取得
File.open('./date_time.rb', 'r') do |f|
  puts f.readlines.count
end
#=> 36

# libディレクトリにhello_world.txtを作成して文字を書き込む
# libディレクトリがないとエラーになる
File.open('./lib/hello_world.txt', 'w') do |f|
  f.puts 'Hello, world!'
end



# 特定の形式のファイルを読み書きする
# CSVクラス
# JSONモジュール
# YAMLモジュール



# CSV
require 'csv'
CSV.open('./lib/sample.csv', 'w') do |csv|
  csv << ['Name', 'Email', 'Age']
  csv << ['Alice', 'alice@example.com', 20]
end


# JSON
require 'json'

user = { name: 'Alice', email: 'alice@example.com', age: 20 }
# => {:name=>"Alice", :email=>"alice@example.com", :age=>20}

# ハッシュをJSON形式に変換する
user_json = user.to_json
# => "{\"name\":\"Alice\",\"email\":\"alice@example.com\",\"age\":20}"

parse_user = JSON.parse(user_json)
# => {"name"=>"Alice", "email"=>"alice@example.com", "age"=>20}
# デフォルトだとキーは文字列になる

symbol_parse_user = JSON.parse(user_json, symbolize_names: true)
#=> {:name=>"Alice", :email=>"alice@example.com", :age=>20}
#=> symbolize_names: trueを第二引数に渡すとキーがシンボルになる


# YAML

require 'yaml'

yaml = <<TEXT
alice:
  name: 'Alice'
  email: 'alice@example.com'
  age: 20
TEXT

# YAMLテキストをパースしてハッシュに変換する
users = YAML.load(yaml)
# => {"alice"=>{"name"=>"Alice", "email"=>"alice@example.com", "age"=>20}}

# ハッシュに新しい要素を追加する
users['alice']['gender'] = :female
# => 
# {
#   "alice"=>{
#     "name"=>"Alice", 
#     "email"=>"alice@example.com", 
#     "age"=>20, 
#     "gender"=>:female
#   }
# }


# ハッシュをYAMLテキストに変換する
puts YAML.dump(users)
# ---
# alice:
#   name: Alice
#   email: alice@example.com
#   age: 20
#   gender: :female

binding.irb
