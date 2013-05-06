#!/usr/bin/env ruby -wKU

require 'sort_util'

def partition(array, _start, _end)
	
	random_index = _start + rand(_end -_start)	
	swap_elements(array, _end, random_index)

	i = _start-1
	j = _start

	while (j < _end)
		if (Integer(array[j]) > Integer(array[_end])) 
			j += 1
		else
			i +=1 
			swap_elements(array, i, j)
			j += 1	
		end 
	end

	i+=1
	swap_elements(array, i, _end)

	return i
end

def quicksort(array, _start, _end)
	
	if(array.size == 0 or _start >= _end)
		return
	else
		pivot = partition(array, _start, _end)
		
		quicksort(array, _start, pivot-1)
		quicksort(array, pivot+1 , _end)	
	end	
end 

if __FILE__ == $0
	array = [5,3,4,8,9,2,6,1,7]
	quicksort(array, 0, array.size-1)

	$logger.debug("Sorted sequence is [ " + String(array.join(',')) + " ]")
end 
