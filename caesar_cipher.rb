def caesar_cipher(str, shift_factor)
	shift_factor = shift_factor.to_i
	new_str = ""
	char = ""
	str.each_char{ |x|
		char = x
		special = "?.<>',?[]}{=-)(*&^%$#`~{} "
		if !special.include?(x)
			shift_factor.times { 
				if char.downcase != "z" 
					char = char.next 
				else 
					char = char.casecmp("Z") ? "A" : "a"
				end
			} 
		else
			  char = x
		end
		new_str += char
	}
	new_str
end
		
puts "Enter a text: "
str = gets.chomp
puts "Enter a number: "
num = gets.chomp
puts caesar_cipher(str, num)