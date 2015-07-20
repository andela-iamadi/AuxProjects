def findMinMax(arr)
	arr = arr.minmax
	arr.delete_at(1) if (arr[0] == arr[1])
	return arr
end

arr = [2, 2, 2]

check = findMinMax(arr)
puts check
puts "yes, an array" if check.is_a? Array