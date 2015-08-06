require "minitest/autorun"
require 'linked_list'

class LinkedListTest < Minitest::Test

	def setup
		@list = LinkedList.new(2)
	end

	def test_new
		list = LinkedList.new(2)
		assert_equal 2, list[0]
	end

	def test_append
		@list.append(3)
		assert_equal 3, @list[1]
	end

	def test_delete
		@list.append(3)
		deleted = @list.delete(1)
		assert_equal 1, @list.size
	end

	def test_size_with_a_single_element
		assert_equal 1, @list.size
	end

	def test_size
		@list.append(20)
		@list << 30
		assert_equal 3, @list.size
	end
end