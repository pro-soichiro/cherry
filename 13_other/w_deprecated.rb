# 非推奨機能を使った際に警告を出力する


# ruby 2.7.2以降ではオプションをつけなければ警告されない。

lambda(&proc{})

# ruby -W:deprecated ファイルパス
#=> warning: lambda without a literal block is deprecated; 
#   use the proc without lambda instead


# もしくは、プログラム内でWarning[:deprecated]にtrueまたは
# falseをセットして警告の表示・非表示を切り替える

Warning[:deprecated] = true

lambda(&proc{})
#=> warning: lambda without a literal block is deprecated; 
#   use the proc without lambda instead


