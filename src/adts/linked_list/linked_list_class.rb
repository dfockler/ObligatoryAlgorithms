#Implementing a single linked list
class LinkedList

	require "./node_class"

	attr_reader :head

	def initialize(value)
		@head = Node.new(value, nil)
	end

	def find_by_value(value)
		curr = @head
		while curr.value != value
			if curr.ref == nil
				return nil
			end
			curr = curr.ref
		end
		return curr
	end

	def find_by_index(index)
		curr = @head
		i = 0
		until curr == nil || i >= index
			if curr.ref == nil
				return nil
			end
			curr = curr.ref
			i += 1
		end
		return curr
	end

	def insert(value)
		curr = @head
		while curr.ref != nil
			curr = curr.ref
		end
		curr.ref = Node.new(value,nil)
	end

	def insert_after_index(index, new_value)
		new_node = Node.new(new_value, nil)
		node = find_by_index(index)
		if node == nil
			return false
		end
		new_node.ref = node.ref
		node.ref = new_node
		return true
	end

	def to_s()
		curr = @head
		to_str = curr.value.to_s
		curr = curr.ref
		begin
			to_str = to_str + ', ' + curr.value.to_s
			curr = curr.ref
		end while curr != nil

		return to_str
	end
end