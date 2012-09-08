class Confetti::Builder
  attr_reader :config
  
  def self.build(env, &bl)
    builder = new env, &bl
    builder.config
  end
  
  def initialize(env, &blk)
    @envs = {}
    instance_eval &blk
    
    attrs = @envs[env]
    
    puts attrs.inspect
    puts "^ attrs"
    @config = Confetti::Config.new attrs
  end

  def env(name, &blk)
    conf = Confetti::ConfItem.build &blk
    @envs[name] = conf
  end
  
end