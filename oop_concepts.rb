#!/usr/bin/ruby

require 'base64'

class Base
	
	private
		def getSocial
			print "Social " + Base64.encode64("xxx-xx-xxxx") 
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
			
		def show
			super
			print "Child [ id=" + String(@id) + ", name=" + String(name) + ",age=" + "#{age}" + " ]\n"
		end

		def age
			@age
		end

		def getSocial
			super
		end
end

if __FILE__ == $0

	fChild = FirstChild.new(5,"Pratik")
	fChild.show

	fChild.name="Krishnarpita"
	fChild.show
	print fChild.id

end 