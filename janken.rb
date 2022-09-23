# あっち向いてホイが終了したか判断する変数
atihoi_end = 0

while atihoi_end == 0
  # じゃんけんが始まったか判断する変数
  janken_end = 0

  # じゃんけんに勝ったか判断する変数
  janken_juge = 0

  # あっち向いてホイで右か左を出したか判断する変数
  rl_juge = 0

  puts "じゃんけん、、、"
  puts "0(グー) 1(チョキ) 2(パー)"
  my_hans = {
    "0" => "グー",
    "1" => "チョキ",
    "2" => "パー"
  }

  # 出したい手を入力させる
  get_janken = gets.to_s.chomp
  myhans_get = my_hans["#{get_janken}"]

  puts "ポイ！"
  puts "------------------------------"

  # 相手の出す手をランダムに取得して表示
  enemy_hans = ["グー","チョキ","パー"]
  getenemy_hans = enemy_hans.sample

  # ジャンケンの結果を表示
  puts "あなた：#{myhans_get}を出しました"
  puts "相手：#{getenemy_hans}を出しました"
  puts "------------------------------"

  # アイコの場合
  while myhans_get == getenemy_hans 
    puts "0(グー) 1(チョキ) 2(パー)"
    puts "あいこで、、、"
    #   自分が出した手を取得
    my_hans = {
    "0" => "グー",
    "1" => "チョキ",
    "2" => "パー"
    }
    get_janken = gets.to_s.chomp
    myhans_get = my_hans["#{get_janken}"]

    #   相手が出した手を取得
    enemy_hans = ["グー","チョキ","パー"]
    getenemy_hans = enemy_hans.sample

    puts "しょ！"
    puts "------------------------------"
    puts "あなた：#{myhans_get}を出しました"
    puts "相手：#{getenemy_hans}を出しました"
    puts "------------------------------"
  end

  # じゃんけんに勝ったか負けたかの判断
  while janken_end == 0
    janken_pa = ""
    janken_gu = ""
    janken_tyoki = ""
    janken_juge = 0

    #   あなたパー、相手チョキ
    if myhans_get == "パー" && getenemy_hans == "チョキ"
      janken_pa = 1
      janken_tyoki = 2
      if janken_pa < janken_tyoki
        puts "あなたの負け"
        puts "-----------------------------"
        janken_end = 1
        janken_juge = 0
      end
    end
    #   あなたパー、相手グー
    if myhans_get == "パー" && getenemy_hans == "グー"
      janken_pa = 2
      janken_gu = 1
      if janken_pa > janken_gu
        puts "あなたの勝ち"
        puts "-----------------------------"
        janken_end = 1
        janken_juge = 1
      end
    end
    #   あなたグー、相手チョキ
    if myhans_get == "グー" && getenemy_hans == "チョキ"
      janken_gu = 2
      janken_tyoki = 1
      if janken_gu > janken_tyoki
        puts "あなたの勝ち"
        puts "-----------------------------"
        janken_end = 1
        janken_juge = 1
      end
    end
      #   あなたグー、相手パー
    if myhans_get == "グー" && getenemy_hans == "パー"
      janken_gu = 1
      janken_pa = 2
      if janken_gu < janken_pa
        puts "あなたの負け"
        puts "-----------------------------"
        janken_end = 1
        janken_juge = 0
      end
    end
      #   あなたチョキ、相手パー
    if myhans_get == "チョキ" && getenemy_hans == "パー"
      janken_tyoki = 2
      janken_pa = 1
      if janken_tyoki > janken_pa
        puts "あなたの勝ち"
        puts "-----------------------------"
        janken_end = 1
        janken_juge = 1
      end
    end
    #   あなたチョキ、相手グー
    if myhans_get == "チョキ" && getenemy_hans == "グー"
      janken_tyoki = 1
      janken_gu = 2
      if janken_tyoki < janken_gu
        puts "あなたの負け"
        puts "-----------------------------"
        janken_end = 1
        janken_juge = 0
      end
    end
  end
  # --------------------------------------------
  # ここからあっち向いてホイの処理       
  puts "0(上👆) 1(下👇) 2(右👉) 3(左👈)"

  # 指を配列に格納
  my_finger = {
    "0" => '上👆',
    "1" => '下👇',
    "2" => '右👉',
    "3" => '左👈'
  }
  #---------------------------------------------
  # あなたがじゃんけんに勝った場合
  if  janken_juge == 1
    puts "あなた：指を指す側"
    puts "あいて：指を指される側"
    puts "あっち向いて、、、"
  #   自分が出す手を取得
    get_my_finger = gets.to_s.chomp
    get_my_finger = my_finger["#{get_my_finger}"]
  #   相手が出す手を取得
    enemy_finger = ["上👆","下👇","右👉","左👈"]
    getenemy_finger = enemy_finger.sample
    puts "ほい！"
    puts "----------------------------"
    puts "あなた：#{get_my_finger}を指しました"
    puts "あいて：#{getenemy_finger}を向きました"
    puts "----------------------------"

    # 右か左を出した場合
    if (get_my_finger == "右👉" || get_my_finger == "左👈") && (getenemy_finger == "右👉" || getenemy_finger == "左👈")
      if get_my_finger == getenemy_finger
        puts "もう一度ジャンケン"
      end
      if get_my_finger != getenemy_finger
        atihoi_end = 1
        puts "あなたの勝ちです。おめでとう！"
      end

      # 出した手が同じだった場合(上か下で同じだった場合)
    elsif get_my_finger == getenemy_finger 
      atihoi_end = 1
      puts "あなたの勝ちです。おめでとう！"

      # 出した手が違かった場合(右左以外で違かった場合)
    elsif get_my_finger != getenemy_finger
      puts "もう一度ジャンケン"
    end
   #   -------------------------------------------------------
   #   相手がじゃんけんに勝った場合
  else  
    puts "あなた：指を指される側"
    puts "あいて：指を指す側"
    puts "あっち向いて、、、"
  #   自分が出す手を取得
    get_my_finger = gets.to_s.chomp
    get_my_finger = my_finger["#{get_my_finger}"]
  #   相手が出す手を取得
    enemy_finger = ["上👆","下👇","右👉","左👈"]
    getenemy_finger = enemy_finger.sample
    puts "ほい！"
    puts "----------------------------"
    puts "あなた：#{get_my_finger}を向きました"
    puts "あいて：#{getenemy_finger}を指しました"
    puts "----------------------------"

    # 右か左を出した場合
    if (get_my_finger == "右👉" || get_my_finger == "左👈") && (getenemy_finger == "右👉" || getenemy_finger == "左👈")
      if get_my_finger == getenemy_finger
        puts "もう一度ジャンケン"
      end
      if get_my_finger != getenemy_finger
        atihoi_end = 1
        puts "あいての勝ちです。残念(´ω`)"
      end

      # 出した手が同じだった場合(上か下で同じだった場合)
    elsif get_my_finger == getenemy_finger 
      atihoi_end = 1
      puts "あいての勝ちです。残念(´ω`)"

      # 出した手が違かった場合(右左以外で違かった場合)
    elsif get_my_finger != getenemy_finger
      puts "もう一度ジャンケン"
    end
  end
end