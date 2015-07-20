def prime(n)
	n = n.to_i
	return if n < 2
	return (2..n/2).none? {|i| n % i == 0} ? true : false
end

puts "Enter a number: "
num = gets.chomp


puts prime(num) ? "Number is prime" : "not prime"