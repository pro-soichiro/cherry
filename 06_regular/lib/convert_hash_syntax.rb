def convert_hash_syntax(old_syntax)
  # old_syntax.gsub(/:(\w+) *=> */, '\1: ')
  old_syntax.gsub(/:(\w+) *=> */) do
    "#{$1}: "
  end
end
