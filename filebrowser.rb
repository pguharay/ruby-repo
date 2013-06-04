#!/usr/bin/ruby

class FileNode
	
	def initialize(name, permission, size, history)
		@name = name
		@permission = permission
		@size = size
		@history = history
	end	

	def toString
		return String(@name) + " " * (30 - @name.length) + @permission.join(',') + " " * 10 + String(@size) + " " * (10 - (String(@size)).length) + @history.join(' ')
	end
end	

def browse(location)

	if (!File.directory?(location))
		raise location + " is not a directory !"
	end 

	Dir.foreach(location){|node|
		if(File.exists?(node))
			stat = File.stat(node)
			if(stat.directory? and (node != "." and node != ".."))
				browse(node)
				#print node + "\n"
			elsif(stat.file?)
				fNode = FileNode.new(node, [File.readable?(node) ? "R" : "", File.writable?(node) ? "W" : ""], File.size(node), [File.ctime(node), File.mtime(node)])
				print fNode.toString + "\n"

			end
		end
	}

end 

if __FILE__ == $0
	print "Name" + " " * 20 + "Permissions" + " "*8 + "Size" + " " * 10 + "Create Time" + " "* 20 + "Modification Time\n"
	
	begin
		browse(".")
	rescue RuntimeError, SystemCallError
		print String($!) + "\n"
	ensure 	
		print "ensure called \n"
	end 	
end 