def stringLength(str_to_count)
	str_class = str_to_count.class.to_s;
	arr_to_return = []
	case str_class
		when "Array"
			str_to_count.each{|item| arr_to_return << item.length }
			return arr_to_return
		when "Hash"
			str_to_count.each { |item, value| str_to_count[item] = value.length}
		else
			return str_to_count.to_s.length
	end
end
arr = { t: "something", u: "anything", v: "nothings" }
puts stringLength(arr)