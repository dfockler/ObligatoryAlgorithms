require 'minitest/autorun'
require 'quick_sort'

class QuickSortTest < Minitest::Test

  def setup
    @array = [100, 2, 49, 94, 8, -1]
  end

  def test_sort
    sorted = QuickSort.sort(@array)
    assert_equal [-1, 2, 8, 49, 94, 100], sorted
  end

  def test_single_element
    array = [1]
    assert_equal [1], QuickSort.sort(array)
  end

  def test_multiples
    array = [10, 10, 2]
    assert_equal [2, 10, 10], QuickSort.sort(array)
  end

  def test_zero
    array = [-1, 0, 10]
    assert_equal [-1, 0, 10], QuickSort.sort(array)
  end

  def test_non_ints
    array = ["oranges", "apples", "bananas"]
    assert_equal ["apples", "bananas", "oranges"], QuickSort.sort(array)
  end
end