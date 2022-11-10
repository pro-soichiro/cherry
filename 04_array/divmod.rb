# divmodは商と余りを配列で返す
14.divmod(3) #=> [4, 2]

# これを多重代入で受け取る
quotient, remainder = 14.divmod(3)
p quotient #=> 4
p remainder #=> 2