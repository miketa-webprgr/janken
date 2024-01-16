require './concerns/helper'

class Game
  include Helper

  def initialize(battle_count, win_count: 0, lose_count: 0)
    @battle_count = battle_count
    @win_count = win_count
    @lose_count = lose_count
  end

  def battle(janken)
    while @win_count + @lose_count < @battle_count
      case janken.battle
      when '勝ち'
        @win_count += 1
      when '負け'
        @lose_count += 1
      else
        raise '勝負が判定できません'
      end
    end

    show_result
  end

  private

  def show_result
    result = @win_count > @lose_count ? '勝ち' : '負け'

    puts '結果'
    puts "#{@win_count}勝#{@lose_count}敗であなたの#{result}"
  end
end


