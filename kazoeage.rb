def kazoeage
  warukazu = 1000000009

  n, target = gets.chomp.split(" ").map(&:to_i)
  value = gets.chomp.split(" ").map(&:to_i)
  dp = Array.new(n+1){ Array.new(target+1, 0) }
  dp[0][0] = 1

  n.times do |i|
    (target + 1).times do |j|
      dp[i+1][j] = (dp[i+1][j] + dp[i][j]) % warukazu
      dp[i+1][j] = (dp[i+1][j] + dp[i][j - value[i]]) % warukazu if j >= value[i]
    end
  end
  dp[n][target]
end

puts kazoeage
