# (配列, 調べたい値)を引数にとり、[調べたい値]が配列の何番目に入っているかを返す関数
def binary_search(list, item)
  # インデックスの最小値
  low = 0
  # インデックスの最大値
  high = list.size - 1

  while low <= high
    mid = (low + high) / 2
    guess = list[mid]
    return mid if guess == item
    return high = mid -1 if guess > item
    low = mid +1
  end

  return -1
end

# 配列の作成
my_list = [1, 3, 5, 7, 0]

# 標準入力で調べたい値を入力
target_num = gets.to_i

result = binary_search(my_list, target_num)

if result == -1
  puts "値が #{target_num} の要素は配列存在しません"
else
  puts "要素の値が #{target_num} のインデックスは #{result}"
end
