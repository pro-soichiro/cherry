# def to_hex(r,g,b)
#   '#' +
#     r.to_s(16).rjust(2, '0') +
#     g.to_s(16).rjust(2, '0') +
#     b.to_s(16).rjust(2, '0')
# end

def to_hex(r,g,b)
  [r,g,b].sum('#') do |n|
    n.to_s(16).rjust(2, '0')
  end
end


# def to_ints(str)
#   r = str[1..2]
#   g = str[3..4]
#   b = str[5..6]
#   ints = []
#   [r,g,b].each do |s|
#     ints << s.hex
#   end
#   ints
# end

# def to_ints(str)
#   r = str[1..2]
#   g = str[3..4]
#   b = str[5..6]
#   [r,g,b].map do |s| s.hex end
# end

# def to_ints(str)
#   r, g, b = str[1..2], str[3..4], str[5..6]
#   [r,g,b].map do |s| s.hex end
# end

# エンドレスメソッド定義構文
def to_ints(hex) = hex.scan(/\w\w/).map(&:hex)
