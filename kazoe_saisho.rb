def saisho
  n, target = gets.chomp.split(" ").map(&:to_i)
  numbers = gets.chomp.split(" ").map(&:to_i)
  max = 1000000007
  dp = Array.new(n+1){ Array.new(target+1, max) }
  dp[0][0] = 0

  n.times do |i|
    (target+1).times do |j|
      dp[i+1][j] = [dp[i+1][j], dp[i][j]].min
      dp[i+1][j] =  [dp[i+1][j], dp[i][j - numbers[i]] + 1].min if j >= numbers[i]
    end
  end

  dp[n][target] < max ? dp[n][target] : -1
end

puts saisho
