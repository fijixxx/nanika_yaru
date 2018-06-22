# https://qiita.com/drken/items/a5e6fe22863b7992efdb
# n, max_weight = 6, 8
# [weight, value] = [2, 3][1, 2][3, 6][2, 1][1, 3][5, 85]のとき答えは 91

def napsack
  n, max_weight = gets.chomp.split(" ").map(&:to_i)
  weight = []
  value = []
  n.times do | i |
    weight[i], value[i] = gets.chomp.split(" ").map(&:to_i)
  end
  dp = Array.new(n+1){ Array.new(max_weight+1, 0) }
  dp[0][0]

  n.times do |i|
    (max_weight+1).times do |j|
      dp[i+1][j] = dp[i][j]
      dp[i+1][j] = [dp[i][j - weight[i]] + value[i], dp[i][j]].max if j >= weight[i]
    end
  end
  print(dp)
  dp[n][max_weight]
end

puts napsack
