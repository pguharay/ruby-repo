#!/usr/bin/env ruby -wKU

require 'sort_util'

def shellsort(array)
	gap = array.size >> 1

	while(gap >= 1)
		for j in 0 .. array.size-1
			i = 0
			while (i+gap <= array.size-1)
				if(array[i].to_i > array[i+gap].to_i)
					swap_elements(array,i,i+gap)
				end
			i+=1
			end 
		end 
		gap >>= 1
	end 

end 

if __FILE__ == $0
	
	array = [5,3,4,8,9,11,2,10,6,7,1]
	shellsort(array)
	$logger.debug("Sorted sequence is [ " + String(array.join(',')) + " ]")

end 