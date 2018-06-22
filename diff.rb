# https://yukicoder.me/problems/no/225
# 長さnの文字列Sと長さmの文字列Tが与えられます。文字列を構成する各文字は、'a'～'z'です。
# 今、Sに以下の3種類の操作のいずれかを順次実施してTに変換したいです。
# そのような一連の操作のうち、操作回数の最小となるものについて、その最小値を出力するプログラムを書いて下さい。
#
# (操作)
# 【変更】 Sの中から文字S[ i ]を1個選んで、その文字を'a'～'z'のいずれかの好きな文字に変更します。
# 【削除】 Sの中から文字S[ i ]を1個選んで、その文字を削除します。削除によって空文字列になることも許容します。
# 【挿入】 Sの好きな箇所に、'a'～'z'のいずれかの文字を挿入します。特に、Sの先頭や最後尾に文字を追加することもできます。
#
#
#
# 入力
#
# 9 9
# abcdefghi
# acdefxhij
#
# のとき出力 3


def diff
  n, m = gets.chomp.split(" ").map(&:to_i)
  s = gets.chomp
  t = gets.chomp
  inf = 100000007
  dp = Array.new(n+2){Array.new(m+2, inf)}
  dp[0][0] = 0

  0.upto n do |i|
    0.upto m do |j|
      dp[i+1][j+1] = s[i] == t[j] ? [dp[i+1][j+1], dp[i][j]].min : [dp[i+1][j+1], dp[i][j]+1 ].min
      dp[i+1][j] = [dp[i+1][j], dp[i][j]+1].min
      dp[i][j+1] = [dp[i][j+1], dp[i][j]+1].min
    end
  end

  dp[n][m]
end

puts diff
