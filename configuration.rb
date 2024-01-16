require './concerns/helper'

class Configuration
  SELECTABLE_BATTLE_MODE  = %i[easy hard].freeze
  SELECTABLE_BATTLE_COUNT = [1, 3, 5].freeze

  include Helper

  attr_reader :battle_mode, :battle_count

  def initialize(player_selection: false, battle_mode: nil, battle_count: nil)
    @battle_mode = player_selection ? set_battle_mode : checked_battle_mode(battle_mode)
    @battle_count = player_selection ? set_battle_count : checked_battle_count(battle_count)
  end

  private

  def set_battle_mode
    puts 'Easyモードにしますか、hardモードにしますか？（press easy or hard)'
    battle_mode = gets.chomp.to_sym

    unless selectable_battle_mode?(battle_mode)
      puts "\neasyかhardを選択してください"
      return set_battle_mode
    end

    puts "#{battle_mode.to_s}モードを選択しました"
    puts "\n"

    battle_mode
  end

  def set_battle_count
    puts '何本勝負？(press 1 or 3 or 5)'
    battle_count = gets.chomp.to_i

    unless selectable_battle_count?(battle_count)
      puts "\n1, 3, 5回勝負しか出来ません。。。"
      return set_battle_count
    end

    puts "#{battle_count}本勝負を選びました"
    puts "\n"

    battle_count
  end

  private

  def selectable_battle_mode?(battle_mode)
    SELECTABLE_BATTLE_MODE.include?(battle_mode.to_sym)
  end

  def selectable_battle_count?(battle_count)
    SELECTABLE_BATTLE_COUNT.include?(battle_count.to_i)
  end

  def checked_battle_mode(battle_mode)
    selectable_battle_mode?(battle_mode) ? battle_mode : (raise "#{battle_mode}は選択できません")
  end

  def checked_battle_count(battle_count)
    selectable_battle_count?(battle_count) ? battle_count : (raise "#{battle_count}は選択できません")
  end
end
