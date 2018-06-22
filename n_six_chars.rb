def n_six_chars
  n = gets.chomp.to_i
  mojiretu = %w(a b c d e f)

  ans = mojiretu.repeated_combination(n)
  ans.collect {|arr| arr.join}
end

puts n_six_chars
