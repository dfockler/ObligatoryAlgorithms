class QuickSort
  def self.pivot(array, pivot_index)
    hi = []
    lo = []
    pivot = array[pivot_index]
    array.each_with_index do |value, i|
      if i != pivot_index
        value < pivot ? lo << value : hi << value
      end
    end
    (lo << array[pivot_index]) + hi
  end

  def self.sort(array, lo = 0, hi = array.size)
    if lo < hi
      p = lo
      array = pivot(array, p)
      sort(array, lo, p - 1)
      sort(array, p + 1, hi)
    else
      array
    end
  end
end