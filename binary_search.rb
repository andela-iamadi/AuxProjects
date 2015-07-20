require 'benchmark'

class Array


	def toTwenty
		arr = []
		1.upto(20) { |num| arr << num }
		return arr
	end

	def cheatToForty
		return (1..20).to_a.map {|x| x *= 2 }
	end

	def toForty
		arr = []
		(2..40).step(2) { |num| arr << num }
		return arr
	end

	def toOneThousand
		arr = []
		(10..1000).step(10) { |num| arr << num }
		return arr
	end

	def search(n)
		n = n.to_i
		@result = Hash.new(0)

		@count = 0
		@index = 0
		@length = 0
		found = false

		@index = self.index(n)
		@length = self.length

		@index = binarySearch(self.sort, n, 0, -1) 
		
		@result[:count] = @count
		#@result[:count] = 0 if n == 20 || n == 40 || n == 1000
		@result[:index] = @index
		@result[:length] = @length
		puts "result: #{@result}"
		return @result
	end

	def binarySearch (arr_to_be_searched, num_to_search_for, min, max)
		indx = -1 
 		mid_index = get_mid_index(arr_to_be_searched)
 		mid = arr_to_be_searched[mid_index]

 		indx = 0
 		return indx if !(num_to_search_for > arr_to_be_searched[min] && num_to_search_for < arr_to_be_searched[max])

		while num_to_search_for > arr_to_be_searched[0] && num_to_search_for < arr_to_be_searched[-1]
			puts "Array entering loop: #{arr_to_be_searched}"
			puts "number to search for: #{num_to_search_for}, min: #{min}, max, #{max}, mid: #{mid_index}, loop count: #{@count}"
			
			break if (indx = num_check(arr_to_be_searched, num_to_search_for, arr_to_be_searched[min], mid, arr_to_be_searched[max])) != false  


			if num_to_search_for < mid
				puts "number less than mid at index: #{mid_index}. return array: #{arr_to_be_searched[min..max]}"
				min = 1
				max = mid_index-1
				arr_to_be_searched = arr_to_be_searched[min..max]
				break if arr_to_be_searched.length == 0
				mid_index = get_mid_index(arr_to_be_searched)
 				mid = arr_to_be_searched[mid_index]
				puts " mid at index: #{mid_index}. array to search: #{arr_to_be_searched}"
				puts "array min: #{min}, max: #{max}"
				puts "median of array: #{mid}"
			elsif num_to_search_for > arr_to_be_searched[mid_index] && num_to_search_for < arr_to_be_searched[-1]
				puts "number greater than mid. returned array: #{arr_to_be_searched[min..max]}"
				min = mid_index + 1
				max = -1
				arr_to_be_searched = arr_to_be_searched[min..max]
				break if arr_to_be_searched.length == 0
				mid_index = get_mid_index(arr_to_be_searched)
	 				mid = arr_to_be_searched[mid_index]
				puts "array to search: #{arr_to_be_searched}"
				puts "array min: #{min}, max: #{max}"
				puts "median of array: #{mid}"
			else
				indx = -1; break
			end
			@count += 1
		end
		return indx == false || indx == nil ? -1 : indx
	end

	def num_check(arr_to_be_searched, num_to_search_for, min, mid, max)		
		if num_to_search_for == min || num_to_search_for == max || num_to_search_for == mid
			puts "number found! it exists at index #{arr_to_be_searched.index_of(num_to_search_for)} of array #{arr_to_be_searched}"
			puts "That means index #{self.index(num_to_search_for)} of original array: #{self}"
			return self.index_of(num_to_search_for)
		elsif arr_to_be_searched.length == 1 || arr_to_be_searched.length == 0
			return suggested_index_when_not_found(num_to_search_for, min, max)
		else
			return false
		end

	end

	def get_mid_index(arr_to_be_searched)
 		mid_index = (arr_to_be_searched.length / 2).to_i - 1
	end

	def index_of(num)
		indx = 0;
		self.each { |x|
			if num == x
				index = true;
				return indx
			end
			indx += 1 
		}
		return indx 
	end

	def suggested_index_when_not_found(num_to_search_for, min, max)
		if num_to_search_for > max
			if self[-1] == max
				return -1
			else
				return self.index(max) + 1
			end
		elsif num_to_search_for < min
			return 0
		else
			return self.index(min) + 1
		end
	end

	def arr_error
		return "Array length should not be zero!"
	end
end

	def loopLine
		x = 0
		100000.times { |n| x += n }
		
	end


	def loopMultiLine
		x = 0; 100000.times { |n| x += n }; 
	end
neToTwenty = [].toTwenty
woToForty = [].toForty
enToOneThousand = [].toOneThousand

test = Proc.new { 10000.times { woToForty = [].toForty }}
test1 = Proc.new { 10000.times { woToForty = [].cheatToForty} }

test = Proc.new { 10.times { loopLine }}
test1 = Proc.new { 10.times { loopMultiLine} }

puts "enter a number: "
num = gets.chomp
puts "Twenty array check"
puts neToTwenty.search(num)
puts "Forty array check"
puts woToForty.search(num)
puts "One thousand array check"
puts enToOneThousand.search(num)
#puts "Time of execution: " + Benchmark.realtime(&test).to_s
#puts "Time of execution: " + Benchmark.realtime(&test1).to_s
