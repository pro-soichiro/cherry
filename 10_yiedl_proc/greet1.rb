def greet(&block)
  puts 'おはよう'
  text =
    if block.arity == 1
      yield 'こんにちは'
    elsif block.arity == 2
      yield 'こんに','ちは'
    end
  puts text
  puts 'こんばんは'
end


greet do |text|
  text * 2
end


greet do |text_1, text_2|
  text_1 * 2 + text_2 * 2
end