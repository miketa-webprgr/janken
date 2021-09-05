GCP = { g: 'グー', c: 'チョキ', p: 'パー' }
GCP_NUMBER = { 1 => :g, 2 => :c, 3 => :p }
GCP_RESULT = { g: { g: 'あいこ', c: '勝ち', p: '負け' },
               c: { g: '負け', c: 'あいこ', p: '勝ち' },
               p: { g: '勝ち', c: '負け', p: 'あいこ' },
             }

def janken_battle
  initialize_battle_count
  initialize_win_and_lose_count

  while @win_count + @lose_count < @battle_count do
    janken
  end

  show_janken_battle_result
end

def initialize_battle_count
  ask_battle_count

  until [1, 3, 5].include?(@battle_count) do
    puts "\n1, 3, 5回勝負しか出来ません。。。"
    ask_battle_count
  end

  puts "#{@battle_count}本勝負を選びました"
end

def ask_battle_count
  puts "何本勝負？(press 1 or 3 or 5)"
  @battle_count = gets.chomp.to_i
end

def initialize_win_and_lose_count
  @win_count = 0
  @lose_count = 0
end

def janken
  store_user_hand
  show_cpu_hand
  show_user_hand
  judge_winner
end

def store_user_hand
  ask_janken_hand

  until GCP.key?(@user_hand) do
    puts "ふざけないでください！ 正しい値を入力してください！！！"
    ask_janken_hand
  end
end

def ask_janken_hand
  puts "\nじゃんけん…(press g or c or p)"
  @user_hand = gets.chomp.to_sym
end

def show_cpu_hand
  @cpu_hand = GCP_NUMBER[rand(1..3)]
  puts "\nCPU...#{GCP[@cpu_hand]}"
end

def show_user_hand
  puts "あなた...#{GCP[@user_hand]}"
end

def judge_winner 
  result = GCP_RESULT[@user_hand][@cpu_hand]
  puts result + "!"
  
  case result
  when '勝ち'
    @win_count += 1
    reset_hands
  when '負け'
    @lose_count += 1
    reset_hands
  when 'あいこ'
    return janken
  end

  puts "#{@win_count}勝#{@lose_count}敗"
end

def reset_hands
  @user_hand = nil
  @cpu_hand = nil
end
  
def show_janken_battle_result
  result = (@win_count > @lose_count) ? "勝ち" : "負け"

  puts "\n結果"
  puts "#{@win_count}勝#{@lose_count}敗であなたの#{result}" 
end

janken_battle