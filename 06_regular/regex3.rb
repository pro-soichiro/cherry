=begin

^で行頭
$で行末
[ \t]で半角空白とタブ

=end


text = <<-TEXT
def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')
       
hello('Bob')
    
hello('Carol')
TEXT


puts text.gsub(/^[ \t]$/, '')
=begin
出力結果

def hello(name)
  puts "Hello, \#{name}!"
end

hello('Alice')

hello('Bob')

hello('Carol')

=end


=begin

行末に入った無駄なスペースを削除する
^[ \t]+$

インデントがガタガタになったテキストを左寄せにする
^[ \t]+

[\t]の代わりに\sを使う
\sは空白文字全般を表す文字クラス

=end



