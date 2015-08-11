require 'minitest/autorun'
require 'dining_philosophers'

class DiningPhilosophersTest < Minitest::Test
  def test_basic
    results = Diner.serve
    assert_equal 5, results.size
  end
end