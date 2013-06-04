#!/usr/bin/env ruby -wKU

require_relative 'sort_util'

def enumsort(array)

	countarray = Array.new

	resultarray = Array.new

	(0..array.size-1).each{|i|

		(0 .. array.size-1).each{|j|

			if(array[i].to_i < array[j].to_i or (array[i].to_i == array[j].to_i and i<j))
				countarray[j] = Integer(countarray[j]) + 1
			end 
		}
	}
	
	(0..array.size-1).each{|k|
		
		resultarray[countarray[k].to_i] = array[k] 
		countarray[k] = countarray[k].to_i - 1
	}


	return resultarray

end

if __FILE__ == $0
	
	array = [5,3,9,4,8,9,11,2,10,6,7,5,1]
	resultarray=enumsort(array)
	$logger.debug("Sorted sequence is [ " + String(resultarray.join(',')) + " ]")

end 