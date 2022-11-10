# ・10進数を16進数に変換するto_hexメソッドと、16進数を10進数に変換するto_intsメソッドの2つを定義する。
# ・to_hexメソッドは3つの整数を受け取り、それぞれを16進数に変換した文字列を返す。文字列の先頭には“#”を付ける。
# ・to_intsメソッドはRGBカラーを表す16進数の文字列を受け取り、R、G、Bのそれぞれを10進数の整数に変換した値を配列として返す。


# 10進数の数字を16進数の文字列に変換するメソッド
# p 10.to_s(16)
# p 9.to_s(16)
# p 225.to_s(16)

# 16進数の文字列を10進数に変換するメソッド(0x)
# p 0x10.to_s(16) # => 文字列で返る
# p 0x10.to_s(16).to_i


def to_hex(num1,num2,num3)
  [num1,num2,num3].sum("#") do |n|
    new_num = n.to_s(16)
    new_num = '0' + new_num if new_num.size == 1
    new_num
  end
end

p to_hex(0,0,0)
p to_hex(255,255,255)
p to_hex(4,60,120)

# def to_ints(str)
#   str.delete("#")
# end

# p "ffffff".split(/[0-9A-F]{2}/, 3).join(',')


# 実行結果
# to_hex(0,0,0) #=>"#000000"
# to_hex(255,255,255) #=>"#ffffff"
# to_hex(4,60,120) #=>"#043c78"
# to_ints('#000000') #=>[0,0,0]
# to_ints('#ffffff') #=>[255,255,255]
# to_ints('#043c78') #=>[4,60,120]
