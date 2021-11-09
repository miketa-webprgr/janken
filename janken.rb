require './concerns/helper'
require './concerns/janken_mapper'

class Janken
  include Helper
  include JankenMapper

  def initialize(player: nil, cpu: nil, battle_mode: :easy)
    @player = player
    @cpu = cpu
    @battle_mode = battle_mode
  end

  def battle
    @player_hand = @player.set_hand
    @cpu_hand = @cpu.set_hand

    puts "あなた...#{GCP[@player_hand]}"

    result = GCP_RESULT[@battle_mode][@player_hand][@cpu_hand]
    puts "#{result}!"

    return battle if result == 'あいこ'

    result
  end
end
