def lcs
  s = gets.chomp
  t = gets.chomp
  dp = Array.new(s.size + 1){ Array.new(t.size + 1, 0) }

  (s.size).times do |i|
    (t.size).times do |j|
      dp[i+1][j+1] = [dp[i+1][j+1], dp[i][j] + 1].max if s[i] == t[j]
      dp[i+1][j+1] = [dp[i+1][j+1], dp[i+1][j]].max
      dp[i+1][j+1] = [dp[i+1][j+1], dp[i][j+1]].max
    end
  end

  dp[s.size][t.size]
end

puts lcs
