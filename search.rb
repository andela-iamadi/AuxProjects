#Hopefully, my comments would lead us through some subtle changes
#All credits still go to the genius Godson: its his creation :)
def searchn (a, n, is_l)
   min = 0
   max = a.length - 1
   mid = 0
   count = 0
   index = 0 #Changed from -1. Why -1? This ain't Andelabls conditions!
   while min <= max #yeah, <= instead of just < . No discrimimation against the blacks. Or the single item arrays
        if a[max] == n
            if is_l
              return max
            end
        end
        
        if a[min] == n
            if !is_l
               return min 
            end
        end
        
        mid = ((max + min) / 2).to_i
        if a[mid].to_i == n
            index = mid
            if is_l
                min = mid + 1
            else 
                max = mid - 1
            end
        elsif a[mid] > n
            max = mid - 1 
            min += 1 if !is_l # When checking for last, we dont want some values to be forever left unchecked!
        else
            min = mid + 1
            max -= 1 if is_l #Similarly, we don't want to do this if we are checking for first
        end
    end
    index
end

=begin

Didn't like the idea of hard-coding a test array, so i convinced searchcall to
be our call guy. Luckily, he agreed, BUT ON TWO CONDITIONS

He only charges the array to be searched and the number to search for

Hard currency right? Luckily, our gets guy pushes this charge to the user if you
don't wish to pay (call) him directly.

oh! and the array doesn't have to be sorted.

HAPPY WEEKEND Y'ALL

=end

def searchcall(arr, num)
  return (searchn(arr, num, true) - searchn(arr, num, false)) + 1 #Why +1? Recall the Index property kinda starts from 0
end

#Ask for input array from the user
puts "Type in a set of real numbers in any order separated by commas"
ar = gets.chomp.split(",")
arr = []
ar.each{|x| arr << x.to_i }
ar = nil; arr.sort!
puts "Type in the number you want to count: "
num = gets.chomp.to_i
puts "Yea, #{num} occurs #{searchcall(arr, num) } times in the given array. So what? "

