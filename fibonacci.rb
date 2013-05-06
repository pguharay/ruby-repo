#!/usr/bin/env ruby -wKU


def fibonacci(range)

	sequence = Array.new 
	_value1 = 0
	_value2 = 1

	(0.. range -2).each{|i|
		_value3 = _value2 + _value1
		_value1 = _value2
		_value2 = _value3

		sequence.push(_value2)
	}

	return sequence
end 

if __FILE__ == $0
	if(ARGV[0].nil? or ARGV[0].is_a? Integer)
		print "Usage fibonacci <range> \n"
	elsif 
		print "The fibonacci sequence " + fibonacci(Integer(ARGV[0])).join(',') + "\n"
	end
end	
