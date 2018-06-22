def six_chars
  mojiretu = %w(a b c d e f)

  ans = []

  mojiretu.each do |a|
    mojiretu.each do |b|
      mojiretu.each do |c|
        ans << a + b + c
      end
    end
  end

  ans
end

puts six_chars
