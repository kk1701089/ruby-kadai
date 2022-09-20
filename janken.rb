# あっち向いてホイが終了したか判断する変数
atihoi_end = 0

while atihoi_end == 0
    puts "じゃんけん、、、"
    puts "0(グー) 1(チョキ) 2(パー)"
    my_hans = {
      "0" => "グー",
      "1" => "チョキ",
      "2" => "パー"
    }

    # 出したい手を入力させる
    get_janken = gets.to_s
    myhans_get = my_hans["#{get_janken}"]
    puts get_janken
    puts my_hans
    puts myhans_get

    puts "ポイ！"
    puts "------------------------------"
    # 相手の出す手をランダムに取得して表示
    enemy_hans = ["グー","チョキ","パー"]
    getenemy_hans = enemy_hans.sample

    puts "あなた：#{myhans_get}を出しました"
    puts "相手：#{getenemy_hans}を出しました"
end