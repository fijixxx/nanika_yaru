def henkan
  n = gets.chomp.to_i
  tango = []
  n.times do
    tango << gets.chomp
  end

  # ・末尾が s, sh, ch, o, x のいずれかである英単語の末尾に es を付ける ex. dish => dishes
  # ・末尾が f, fe のいずれかである英単語の末尾の f, fe を除き、末尾に ves を付ける ex. knife => knives
  # ・末尾の1文字が y で、末尾から2文字目が a, i, u, e, o のいずれでもない英単語の末尾の y を除き、末尾に ies を付ける ex. lily => lilies
  # ・上のいずれの条件にも当てはまらない英単語の末尾には s を付ける ex. dog => dogs

  ans = []
  tango.each do | c |
    # まずは末尾の2文字を指定しているものから処理
    c_nimoji = c.slice(-2..-1)
    # sh, ch
    next ans << c + 'es' if c_nimoji == 'sh'
    next ans << c + 'es' if c_nimoji == 'ch'
    # fe
    next ans << c.slice!(0..-3) + 'ves' if c_nimoji == 'fe'
    # 末尾の1文字を指定しているものを処理
    c_ichimoji = c.slice(-1)
    # s, o, x
    next ans << c + 'es' if c_ichimoji == 's'
    next ans << c + 'es' if c_ichimoji == 'o'
    next ans << c + 'es' if c_ichimoji == 'x'
    # f
    next ans << c.chop + 'ves' if c_ichimoji == 'f'
    # 末尾がyかつ末尾から2文字目がa, i, u, e, o のいずれでもない
    flag_ies = 0
    flag_ies = 1 if c_ichimoji == 'y'
    flag_ies = 0 if c.slice(-2) == 'a'
    flag_ies = 0 if c.slice(-2) == 'i'
    flag_ies = 0 if c.slice(-2) == 'u'
    flag_ies = 0 if c.slice(-2) == 'e'
    flag_ies = 0 if c.slice(-2) == 'o'
    next ans << c.chop + 'ies' if flag_ies == 1
    ans << c + 's'
  end

  ans
end

puts henkan
