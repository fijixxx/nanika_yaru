def dp_matching
  a = gets.chomp.split(" ").map(&:to_i)
  b = gets.chomp.split(" ").map(&:to_i)
  m = a.size
  n = b.size
  c = Array.new(m){ Array.new(n, 0) }
  m.times do |i|
    n.times do |j|
      c[i][j] = gets.chomp.split(" ").map(&:to_i)
    end
  end
  dp = Array.new(m+1){ Array.new(n+1, 0) }

  m.times do |i|
    n.times do |j|
      dp[i+1][j+1] = [dp[i][j], dp[i+1][j], dp[i][j+1]].min + c[i][j]
    end
  end

  dp[m][n]
end

puts dp_matching
