#!/usr/bin/env ruby -wKU

require 'sort_util'

def bubblesort(array)
	for i in (array.size-1).downto(0)
		for j in 0 .. i
			if(array[j].to_i > array[j+1].to_i)
				swap_elements(array,j,j+1)
			end 
		end 
	end 
end 

if __FILE__ == $0
	
	array = [5,3,4,8,9,2,10,6,7,1]
	bubblesort(array)
	$logger.debug("Sorted sequence is [ " + String(array.join(',')) + " ]")

end 