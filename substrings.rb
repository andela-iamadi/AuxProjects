def substring(str, dictionary)
	arr_to_return = Hash.new(0)
	dictionary.each { |word|
		puts word if str.include? word
		arr_to_return[word] = str.scan(word).count if str.include? word
	}
	return arr_to_return
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts "Check string"
str = gets.chomp

puts substring(str, dictionary)