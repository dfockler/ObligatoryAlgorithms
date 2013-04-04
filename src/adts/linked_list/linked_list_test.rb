require "./linked_list_class"
require "./node_class"
require "test/unit"

class LinkedListTest < Test::Unit::TestCase
	def test_find_by_index
		list = LinkedList.new(3)
		list.insert(4)
		assert_equal 4, list.find_by_index(1).value
	end

	def test_insert
		list = LinkedList.new(4)
		list.insert(5)
		assert_equal 5, list.find_by_index(1).value
	end

	def test_insert_after_index
		list = LinkedList.new(4)
		list.insert(5)
		list.insert(6)
		list.insert(7)
		list.insert_after_index(3, 8)
		list.insert_after_index(2, -34)
		puts list
		assert_equal -34, list.find_by_index(3).value
	end

	def test_find_by_index_out_of_range
		list = LinkedList.new(5)
		assert_equal nil,list.find_by_index(5)
	end

	def test_find_by_value_not_in_list
		list = LinkedList.new(6)
		list.insert(7)
		assert_equal nil, list.find_by_value(20)
	end

	def test_find_by_value
		list = LinkedList.new(6)
		list.insert(5)
		list.insert(8)
		list.insert(7)
		assert_equal 8, list.find_by_value(8).value
	end

	def test_remove_by_value
		list = LinkedList.new(5)
		list.insert(7)
		list.insert(9)
		list.insert(20)
		list.remove_by_value(9)
		assert_equal nil, list.find_by_value(9)
	end

	def test_remove_by_index
		list = LinkedList.new(5)
		list.insert(7)
		list.insert(9)
		list.insert(20)
		list.remove_by_index(4)
		puts list
	end
end