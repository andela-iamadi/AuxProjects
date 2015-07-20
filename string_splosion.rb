class StringSplosion
	def initialize(str)
		@str = str
	end
	def manipulate
		result = ""
		1.upto(@str.length) { |num| result += @str[0, num] }
		return result
	end
end
str = StringSplosion.new("Something")
s = StringSplosion.new("andela").manipulate()
puts s
#puts "Insert a block of text: "
#str1 = gets.chomp