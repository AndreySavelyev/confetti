require "confetti/version"
require 'confetti/builder'
require 'confetti/conf_item'
require 'confetti/config'

module Confetti

  class << self
    def build(env, &blk)
      Confetti::Builder.build(env, &blk)
    end
  end
  
end
