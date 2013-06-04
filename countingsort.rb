#!/usr/bin/env ruby -wKU

require_relative 'sort_util'

def countingsort(array)
	countArray = Array.new(9,0);
	sortedArray = Array.new(array.size, 0)


	(0 .. array.size-1).each{|i|
		countArray[array[i].to_i] = (countArray[array[i].to_i]).to_i + 1
	}

	(0 .. 8).each{|i|
		countArray[i+1] = Integer(countArray[i+1]) + Integer(countArray[i])
	}

	(0 .. array.size-1).each{|i|
		sortedArray[countArray[array[i].to_i].to_i] = array[i]
		countArray[array[i].to_i] -= 1
	}

	return sortedArray
end 

if __FILE__ == $0
	array = [5,3,4,8,9,2,6,1,7,5,3,4,2]
	sortedArray = countingsort(array)

	$logger.debug("Sorted sequence is [ " + String(sortedArray.join(',')) + " ]")
end 