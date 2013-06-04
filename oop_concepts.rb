#!/usr/bin/ruby 

require 'base64'

class Base
	
	private
		def getSocial
			return "Social " + Base64.encode64("xxx-xx-xxxx") 
		end 

	protected
		
		def show
			print "Base [ id=" + String(@id) + ", name=" + String(name) + ",age=" + "#{age}" + " ]\n"
		end
	
	public

		def initialize(id=1, name="Base")
			@id=id
			@name=name
		end

		def name
			@name
		end 

		def name=(name)
			@name=name
		end 

		def id
			@id
		end 
end 

class FirstChild < Base
	
	public 
		
		def initialize(id, name="FirstChild", age=10)
			super(id,name)
			@age = age
		end 
			
		def to_s
			super
			return "Child [ id=" + String(@id) + ", name=" + String(name) + ",age=" + "#{age}" + " ]"
		end

		def age
			@age
		end

		def getSocial
			super
		end
end

if __FILE__ == $0

	fChild = FirstChild.new(id=5,name="Pratik")
	print String(fChild.to_s) + " : " + String(fChild.getSocial)
	
	fChild.name="Krishnarpita"
	print fChild.to_s


end 