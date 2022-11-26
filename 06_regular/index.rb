=begin

正規表現

=end


# ハッシュロケットをコロン記法へ変換させるメソッドを作る

old_syntax = <<TEXT
{
  :name => 'Alice',
  :age=>20,
  :gender  =>  :female
}
TEXT


# convert_hash_syntax(old_syntax)
# => {
#      name: 'Alice',
#      age: 20,
#      gender: :female
#    }

