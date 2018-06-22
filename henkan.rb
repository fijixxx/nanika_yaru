def henkan
  n = gets.chomp.to_i
  tango = []
  n.times do
    tango << gets.chomp
  end

  # ・末尾が s, sh, ch, o, x のいずれかである英単語の末尾に es を付ける ex. dish => dishes, bas => bases
  # ・末尾が f, fe のいずれかである英単語の末尾の f, fe を除き、末尾に ves を付ける ex. knife => knives, leaf => leaves
  # ・末尾の1文字が y で、末尾から2文字目が a, i, u, e, o のいずれでもない英単語の末尾の y を除き、末尾に ies を付ける ex. lily => lilies, abbey(大修道院という意味だそうです) => abbeys
  # ・上のいずれの条件にも当てはまらない英単語の末尾には s を付ける ex. dog => dogs

  ans = []
  tango.each do | c |
    # まずは末尾の2文字を指定しているものから処理
    c_nimoji = c.slice(-2..-1)
    # sh, ch => +es
    next ans << c + 'es' if c_nimoji == 'sh' || c_nimoji == 'ch'
    # fe => fe を除き +ves
    next ans << c.slice!(0..-3) + 'ves' if c_nimoji == 'fe'
    # 末尾の1文字を指定しているものを処理
    c_ichimoji = c.slice(-1)
    # s, o, x => +es
    target = %w(s o x)
    next ans << c + 'es' if target.include?(c_ichimoji)
    # f => f を除き +ves
    next ans << c.chop + 'ves' if c_ichimoji == 'f'
    # 末尾がyかつ末尾から2文字目が a, i, u, e, o のいずれでもない => y を除き +ies
    flag_ies = 0
    flag_ies = 1 if c_ichimoji == 'y'
    target = %w(a i u e o)
    flag_ies = 0 if target.include?(c.slice(-2))
    next ans << c.chop + 'ies' if flag_ies == 1
    # いずれの条件にも当てはまらない場合は +s
    ans << c + 's'
  end

  ans
end

puts henkan

# 入力例
# 8
# bas
# dish
# leaf
# knife
# be
# lily
# abbey
# dog
#
# 出力例
# bases
# dishes
# leaves
# knives
# bes
# lilies
# abbeys
# dogs
