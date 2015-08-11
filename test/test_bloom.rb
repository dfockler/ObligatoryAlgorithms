require 'minitest/autorun'
require 'bloom'

class BloomFilterTest < Minitest::Test

  def setup
    strings = [
      "blooming onion",
      "flowering bloom",
      "judy bloom",
      "bloom filter",
      "kabloomers"
    ]
    @bloom = BloomFilter.new(strings)
  end

  def test_new
    assert_instance_of BloomFilter, @bloom
  end

  def test_find_true
    in_list = @bloom.find("blooming onion")
    assert in_list
  end

  def test_find_false
    in_list = @bloom.find("breaking bloom")
    refute in_list
  end

end