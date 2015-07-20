require 'pry'

module Enumerables
  def my_each
    count = 0
    while count < self.length
      yield(self[count])
      count += 1
    end
  end

  def my_each_with_index
    count = 0
    num = 0
    while count < self.length
      num = self[count]
      yield(self[num], num)
      count += 1
    end
  end

  def my_select
    arr = self.class == Hash ? {} : []
    count = 0
    while count < self.length
      arr << self[count] if yield(self[count]) == true
      count += 1
    end
    arr
  end

  def my_all?
    arr = self.class == Hash ? {} : []
    count = 0
    while count < self.length
      return false if yield(self[count]) != true
      count += 1
    end
    true
  end

  def my_none?
    arr = self.class == Hash ? {} : []
    count = 0
    while count < self.length
  		return false if yield(self[count])
  		count += 1
  	end
  	true
  end

  def my_count(num = nil)
    count = 0
    n = 0
    while count < self.length
    	if block_given?
    		n += yield(self[count]) ? 1 : 0
    	elsif !num.nil?
    		n += 1 if num == self[count]
    	else
    		n += 1
    	end
  		count += 1
  	end
  	n
  end

  def my_map
    count = 0
    arr = self.class == Hash ? {} : []
    while count < self.length
  		arr << yield(self[count])
  		count += 1
  	end
  	arr
  end

  def my_inject(num)
    count = 0
    total = num
    while count < self.length
  		total = yield(total, self[count])
  		count += 1
  	end
  	total
  end

  def my_map_with_proc(&proc)
    count = 0
    arr = self.class == Hash ? {} : []
    while count < self.length
  		arr << yield(self[count])
  		count += 1
  	end
  	arr
  end

  def my_map_with_proc_block(proc)
    count = 0
    tmp = 0
    arr = self.class == Hash ? {} : []
    while count < self.length
    	tmp = nil
    	tmp = proc.call(self[count]) if !proc.nil?
    	# binding.pry
  		tmp = yield(tmp) if block_given?
  		arr << tmp if !tmp.nil?
  		count += 1
  	end
  	arr
  end
end



class Array
	include Enumerables
end
