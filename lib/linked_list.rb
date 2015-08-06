#Implementing a single linked list

class Node
	attr_accessor :value, :link

	def initialize(value, link = nil)
		@value = value
		@link = link
	end
end

class LinkedList
	attr_accessor :head

	def initialize(value)
		@head = Node.new(value)
	end

	def append(value)
		curr = @head
		while curr.link != nil
			curr = curr.link
		end
		curr.link = Node.new(value)
	end

	alias_method :<<, :append

	def index(index)
		curr = @head
		pos = 0
		while pos < index
			return nil if curr.link.nil?
			curr = curr.link
			pos += 1
		end
		curr.value
	end

	alias_method :[], :index

	def delete(index)
		curr = @head
		prev = nil
		pos = 0
		while pos < index
			return nil if curr.link.nil?
			prev = curr
			curr = curr.link
			pos += 1
		end
		prev.link = curr.link
		curr.value
	end

	def size
		curr = @head
		count = 0
		loop do
			count += 1
			return count if curr.link.nil?
			curr = curr.link
		end
	end

end