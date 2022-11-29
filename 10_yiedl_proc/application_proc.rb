def judge(age)
  adult = Proc.new { |n| n > 20 }
  child = Proc.new { |n| n < 20 }

  case age
  when adult
    '大人です'
  when child
    '子供です'
  else
    'ハタチです'
  end
end

p judge(25) #=> '大人です'
p judge(18) #=> '子供です'
p judge(20) #=> 'ハタチです'
