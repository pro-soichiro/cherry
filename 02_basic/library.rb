# puts Date.today #=>  uninitialized constant Date (NameError)

require 'date'
puts Date.today

require_relative './library2.rb'

library2 = Library2.new #=> library2 inited