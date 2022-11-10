numbers = [1,2,3,4,5]
new_numbers = []
numbers.each { |n| new_numbers << n * 10 }
p new_numbers #=> [10,20,30,40,50]

new_map_numbers = numbers.map { |n| n * 10 }
p new_map_numbers #=> [10,20,30,40,50]
