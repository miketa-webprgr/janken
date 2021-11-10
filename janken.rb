require './concerns/helper'
require './concerns/janken_mapper'

class Janken
  include Helper
  include JankenMapper

  def initialize(player: nil, opponent: nil, battle_mode: :easy)
    @player = player
    @opponent = opponent
    @battle_mode = battle_mode
  end

  def battle
    @player_hand = @player.set_hand
    @opponent_hand = @opponent.set_hand

    puts "あなた...#{GCP[@player_hand]}"

    result = GCP_RESULT[@battle_mode][@player_hand][@opponent_hand]
    puts "#{result}!"

    return battle if result == 'あいこ'

    result
  end
end
