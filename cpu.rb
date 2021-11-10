require './concerns/helper'
require './concerns/janken_mapper'

class Cpu
  include Helper
  include JankenMapper

  attr_reader :hand

  def initialize
    @hand = nil
  end

  def set_hand
    gcp_key = GCP.keys.sample

    puts "\nCPU...#{GCP[gcp_key]}"
    @hand = gcp_key
  end
end

