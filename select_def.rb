def uud
  n = gets.chomp.to_i
  mojiretu = %w(a b c d e f)

  ans = mojiretu.repeated_combination(n)
  moji = ans.collect { |arr| arr.join }
  kotae = []
  moji.each do |m|
    kotae << m if m.include?('def')
  end
  kotae
end

puts uud
