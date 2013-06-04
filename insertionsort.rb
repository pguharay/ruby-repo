#!/usr/bin/env ruby -wKU

require_relative 'sort_util'

def insertionsort(array)
	
	for i in (1).upto(array.size-1)
	
		tmp = array[i]
		j = i-1
		
		until(array[j].to_i < tmp or j < 0)
			array[j+1] = array[j]	
			j -= 1
		end 
		
		array[j+1] = tmp
	end 
end 

if __FILE__ == $0
	
	array = [5,3,4,8,9,2,10,6,7,1]
	insertionsort(array)
	$logger.debug("Sorted sequence is [ " + String(array.join(',')) + " ]")

end 
