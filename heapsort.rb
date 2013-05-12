#!/usr/bin/env ruby -wKU

require 'sort_util'

def max_heapify(array, index)
	
	if(index > $heap_size)
		return 
	end 
		
	left_child = ((index+1) * 2) -1
	right_child = ((index+1) * 2) 

	max_element = array[index].to_i
	max_element_index = index

	if(array[left_child].to_i > max_element and left_child <= $heap_size)
		max_element = array[left_child]
		max_element_index = left_child
	end

	if(array[right_child].to_i > max_element and right_child <= $heap_size)
		max_element = array[right_child]
		max_element_index = right_child
	end 

	if(index != max_element_index)
		swap_elements(array, index, max_element_index)
		max_heapify(array, max_element_index)
	end
end 

def build_max_heap(array)

	(array.size-1 >> 1).downto(0).each{|i|
		max_heapify(array,i)
	}
end

def heapsort(array)
	$heap_size = array.size-1;
	
	build_max_heap(array)
	swap_elements(array, 0, array.size-1);
	$heap_size -= 1
	
	(1..array.size-2).each{|i|
		max_heapify(array, 0)
		swap_elements(array, 0, array.size - (i+1))
		$heap_size -= 1;
	}
	
end  

if __FILE__ == $0
	
	array = [5,3,4,8,9,2,6,7,1,10]
	heapsort(array)
	$logger.debug("Sorted sequence is [ " + String(array.join(',')) + " ]")

end 