class Array

	public
	def compare(arr_to_check, num, min, max, count)
	 		mid = (arr_to_check.length / 2).to_i 
	 		@def_mid ||= mid
	 		@def_min ||= min
	 		@def_max ||= max
	 		@def_arr ||= arr_to_check

	 		puts "Median: #{mid}"
	 		
	 		@counter += 1 if arr_to_check[min] == num
	 		@counter += 1 if arr_to_check[max] == num
	 		@counter += 1 if arr_to_check[mid] == num
	 		min = arr_to_check[0]
	 		max = arr_to_check[-1]
	 		mid = (arr_to_check.length / 2).to_i 
 			puts "ist array: #{arr_to_check}, array min: #{arr_to_check[min]} array mid: #{arr_to_check[mid]} array max: #{arr_to_check[max]}"
 			return if arr_to_check.length == 0
	 		if arr_to_check[mid] <= num && arr_to_check[max] >= num
	 			puts "does here, array: #{arr_to_check}"
	 			compare(arr_to_check[mid+1..max-1], num, mid+1, max-1, @counter)

	 			
	 		end
	 		@crossed ||= 1

	 		if @crossed == 1 
	 			puts "checks here"
		 		min = @def_min
		 		max = @def_max
		 		mid = @def_mid
		 		arr_to_check = @def_arr
		 		@crossed = 0
		 		#puts "mid: #{mid}, max: #{def_max}, min: #{def_min}, num : #{num}"
	 		end

 			puts "second array: #{arr_to_check}, array min: #{arr_to_check[min]} array mid: #{arr_to_check[mid]} array max: #{arr_to_check[max]}"
	 		if num < arr_to_check[mid+1] && num >= arr_to_check[min+1]
	 			puts "and, array: #{arr_to_check}"	 			
	 			compare(arr_to_check[min+1..max-1], num, min+1, mid-1, @counter)
	 		end
	 			
	 		return @counter
	end

	def checkArray(num)
	 	mid = (self.length / 2).to_i - 1
	 	@counter = 0
		count = compare(self.sort, num, 0, -1, @counter)
		return count
	end

end

arr = [3, 4, 4, 5, 5, 5,5, 78, 6, 7, 7, 5, 23, 33]

coun = arr.checkArray(5)
puts coun