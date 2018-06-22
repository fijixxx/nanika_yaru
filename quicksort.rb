#クイックソート
def quicksort(array)
  return array if array.size <= 1
  pivot = array.pop
  less, greater = array.partition { |e| e < pivot }
  quicksort(less) + [pivot] + quicksort(greater)
end

puts quicksort([10, 5, 2, 3])
puts quicksort([2, 3, 5, 10])
