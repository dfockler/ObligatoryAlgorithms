require 'openssl'

class BloomFilter
  attr_accessor :elements

  def initialize(array)
    @elements = array
    hash_elements
  end

  def elements=(elements)
    @elements = elements
    hash_elements
  end

  def hash_elements
    @bit_array = Array.new(20, 0) #Using 20 as the array length

    @elements.each do |string|
      hashes = do_hash(string)
      a = hashes[0]
      b = hashes[1]
      @bit_array[a] = 1
      @bit_array[b] = 1
    end
  end

  def find(element)
    hashes = do_hash(element)
    a = hashes[0]
    b = hashes[1]
    in_list = @bit_array[a] == 1 && @bit_array[b] == 1
    in_list ? true : false
  end

  # A couple nice hash functions, just using 2 for the example
  def do_hash(input)
    a = OpenSSL::Digest.hexdigest("SHA224", input).to_i % 19
    b = OpenSSL::Digest.hexdigest("SHA512", input).to_i % 19
    [a, b]
  end
end