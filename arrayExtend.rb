class Array
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
end

a = [3, 4, 5, 6]
puts a.index_of(5)