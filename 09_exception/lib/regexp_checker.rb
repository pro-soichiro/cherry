print 'Text?:'
text = gets.chomp

begin
  # 例外が発生するのはインスタンス化するタイミングだけだが、
  # retryで再試行する場合に'Pattern?'の文言を表示する必要があるため
  # beginに含めている
  print 'Pattern?:'
  pattern = gets.chomp
  regexp = Regexp.new(pattern)
rescue RegexpError => e
  puts "Invalid pattern: #{e.message}"
  retry
end

matches = text.scan(regexp)
if matches.size > 0
  puts "Matched: #{matches.join(',')}"
else
  puts 'Nothing matched.'
end
