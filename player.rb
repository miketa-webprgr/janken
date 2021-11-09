require './concerns/helper'
require './concerns/janken_mapper'

class Player
  include Helper
  include JankenMapper

  attr_reader :hand

  def initialize
    @hand = nil
  end

  def set_hand
    puts "\nじゃんけん…(press g or c or p)"
    hand = gets.chomp.to_sym

    return @hand = hand if hand_defined?(hand)

    puts 'ふざけないでください！ 正しい値を入力してください！！！'
    set_hand
  end

  private

  def hand_defined?(hand)
    GCP.keys.include?(hand)
  end
end
