# https://qiita.com/drken/items/a5e6fe22863b7992efdb
# 3 10
# 7 5 3 => YES
# 2 6
# 9 7 => NO

def bubunwa
  n, target = gets.chomp.split(" ").map(&:to_i)
  value = gets.chomp.split(" ").map(&:to_i)
  dp = Array.new(n+1){ Array.new(target+1, 0) }
  dp[0][0] = 1

  n.times do |i|
    (target+1).times do |j|
      dp[i+1][j] |= dp[i][j]
      dp[i+1][j] |= dp[i][j-value[i]] if j >= value[i]
    end
  end

  print(dp)
  dp[n][target] == 1 ? 'YES' : 'NO'
end

puts bubunwa
