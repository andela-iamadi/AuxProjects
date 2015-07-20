def words(words_to_count)
	str_arr = words_to_count.split(" ")

	arr_count = Hash.new(0)
	str_arr.each { |item| arr_count[item] += 1 }
	return arr_count
end

puts "enter: "
num = gets.chomp

puts words(num)
