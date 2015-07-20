class Array


	def toTwenty
		arr = []
		1.upto(20) { |num| arr << num }
		return arr
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
		@result[:index] = @index
		@result[:length] = @length
		return @result
	end

	def binarySearch (arr_to_be_searched, num_to_search_for, min, max)
		indx = -1 
 		mid_index = get_mid_index(arr_to_be_searched)
 		mid = arr_to_be_searched[mid_index]
 		indx = false
 		countstart = false
		indx = num_check(arr_to_be_searched, num_to_search_for, arr_to_be_searched[min], mid, arr_to_be_searched[max])
		return indx if indx != false
		indx = -1
		while num_to_search_for >= arr_to_be_searched[0] && num_to_search_for <= arr_to_be_searched[-1]
 		puts "array to be searched: #{arr_to_be_searched}, min: #{min}, max: #{max}, mid: #{mid}"
			
			indx = num_check(arr_to_be_searched, num_to_search_for, arr_to_be_searched[0], mid, arr_to_be_searched[-1])
			return indx if indx != false


			if num_to_search_for < mid && num_to_search_for >= arr_to_be_searched[0]
				min = 1
				max = mid_index-1
				arr_to_be_searched = arr_to_be_searched[min..max]
				break if arr_to_be_searched.length == 0
				mid_index = get_mid_index(arr_to_be_searched)
 				mid = arr_to_be_searched[mid_index]
	 			puts "mid is in lower half at index: #{mid_index}"
			elsif num_to_search_for > arr_to_be_searched[mid_index] && num_to_search_for < arr_to_be_searched[-1]
				min = mid_index + 1
				max = -2
				arr_to_be_searched = arr_to_be_searched[min..max]
				break if arr_to_be_searched.length == 0
				mid_index = get_mid_index(arr_to_be_searched)
	 			mid = arr_to_be_searched[mid_index]
	 			puts "mid is in upper half at index: #{mid_index}"
			else
				indx = -1; break
			end
			@count += 1 if countstart 
			countstart = true
		end
		return indx == false || indx == nil ? -1 : indx
	end



	def num_check(arr_to_be_searched, num_to_search_for, min, mid, max)		
		if num_to_search_for == min || num_to_search_for == max || num_to_search_for == mid
			puts "found number #{num_to_search_for}"
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
				puts "found index of #{x} as #{indx}"
				return indx
			end
			indx += 1 
		}
		return indx 
	end
end

neToTwenty = [].toTwenty
woToForty = [].toForty
enToOneThousand = [].toOneThousand

test = Proc.new { 10000.times { woToForty = [].toForty }}

test = Proc.new { 10.times { loopLine } }

puts "enter a number: "
num = gets.chomp
puts "Twenty array check"
puts neToTwenty.search(num)
puts "Forty array check"
puts woToForty.search(num)
puts "One thousand array check"
puts enToOneThousand.search(num)