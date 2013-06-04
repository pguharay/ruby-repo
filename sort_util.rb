#!/usr/bin/env ruby -wKU

require 'logger'

def swap_elements(array, i,j)
	_temp = array[i]
	array[i] = array[j]
	array[j] = _temp
end 

$logger = Logger.new(STDOUT)