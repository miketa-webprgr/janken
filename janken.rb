require 'byebug'

GCP = { g: 'グー', c: 'チョキ', p: 'パー' }
GCP_RESULT = { g: { g: 'あいこ', c: '勝ち', p: '負け' },
               c: { g: '負け', c: 'あいこ', p: '勝ち' },
               p: { g: '勝ち', c: '負け', p: 'あいこ' },
             }

def janken_battle
  @battle_count = set_battle_count
  @win_count = 0
  @lose_count = 0

  while @win_count + @lose_count < @battle_count do
    janken
  end

  show_janken_battle_result
end

def set_battle_count
  puts "何本勝負？(press 1 or 3 or 5)"
  battle_count = gets.chomp.to_i

  unless [1, 3, 5].include?(battle_count)
    puts "\n1, 3, 5回勝負しか出来ません。。。"
    return set_battle_count
  end

  puts "#{battle_count}本勝負を選びました"
  battle_count
end

def janken
  @user_hand = set_user_hand
  @cpu_hand = set_cpu_hand
  judge_winner
end

def set_user_hand
  puts "\nじゃんけん…(press g or c or p)"
  user_hand = gets.chomp.to_sym

  until GCP.key?(user_hand) do
    puts "ふざけないでください！ 正しい値を入力してください！！！"
    return set_user_hand
  end

  user_hand
end

def set_cpu_hand
  gcp_key = GCP.keys.sample

  puts "\nCPU...#{GCP[gcp_key]}"
  gcp_key
end

def judge_winner 
  puts "あなた...#{GCP[@user_hand]}"

  result = GCP_RESULT[@user_hand][@cpu_hand]
  puts result + "!"
  
  case result
  when '勝ち'
    @win_count += 1
  when '負け'
    @lose_count += 1
  when 'あいこ'
    return janken
  end

  puts "#{@win_count}勝#{@lose_count}敗"
end
  
def show_janken_battle_result
  result = (@win_count > @lose_count) ? "勝ち" : "負け"

  puts "\n結果"
  puts "#{@win_count}勝#{@lose_count}敗であなたの#{result}" 
end

janken_battle