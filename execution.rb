require './configuration'
require './game'
require './janken'
require './player'
require './cpu'

configuration = Configuration.new(player_selection: true)
game = Game.new(configuration.battle_count)
janken = Janken.new(player: Player.new, opponent: Cpu.new, battle_mode: configuration.battle_mode)
game.battle(janken)
