require 'faker'

puts Faker::VERSION
puts Faker::Name.name

# <コマンド>
# bundle exec ruby sample.rb
#
# <実行結果>
# 3.0.0
# Dr. Javier Krajcik
#
#
#
# gem 'faker', '2.16.0'でバージョンを指定し、
# bundle update fakerを実行
#
# <コマンド>
# bundle exec ruby sample.rb
#
# <実行結果>
# 2.16.0
# Ronni Dare
#
#
#
# bundle execを省略すると、その環境にインストールされている
# 一番新しいgemが使用される
# <コマンド>
# ruby sample.rb
#
# <実行結果>
# 3.0.0
# Quincy Balistreri IV

require 'awesome_print'

# apはAwesome Printによって追加される
# ターミナル出力メソッド
ap ['Alice', 'Bob', 'Carol']
# <実行結果>
# 2.16.0
# Prof. Sau Wolf
# [
#     [0] "Alice",
#     [1] "Bob",
#     [2] "Carol"
# ]
