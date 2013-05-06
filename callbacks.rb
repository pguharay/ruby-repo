#!/usr/bin/env ruby -wKU

class MyArray

	def initialize(size)
		if(!size.is_a? Integer or size < 0)
			raise "InvalidArgumentException"
		end 

		@array = Array.new

		(0 .. size-1).each{|i|
			@array.push(rand(size))
		}

	end

	def iterate(code)
		(0 .. @array.size).each{|i|
			code.call(i)
		}
	end 

	def update(codes)
		(0 .. @array.size).each{|i|
			codes[:start].call(i)
			codes[:end].call(i)
		}
		
	end
end	

def print_element(i)
	print Math.sqrt(i)
end 

if __FILE__ == $0
	
	array = MyArray.new(10)

	print "lambda expression :"
	array.iterate(lambda{|a| print a*2})
	puts
	print "Procedure expression :"
	array.iterate(Proc.new{|b| print b**2})
	puts
	print "Method object expression :"
	array.iterate(method(:print_element))
	puts
	array.update({:start=>lambda{|a| print "updating " + String(a+2) + "\n"},:end=>lambda{|b| print "cancelling " + String(b-2) + "\n"}})

end 