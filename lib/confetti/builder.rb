class Confetti::Builder
  attr_reader :config
  
  def self.build(env, &bl)
    builder = new env, &bl
    builder.config
  end
  
  def initialize(env, &blk)
    @env = env
    @envs = {}
    instance_eval &blk
    
    attrs = @envs[@env]
    
    puts attrs.inspect
    puts "^ attrs"
    @config = Confetti::Config.new attrs
  end

  def env(name, &blk)
    conf = Confetti::ConfItem.build &blk
    puts "w9847384789237834982734982"
    @envs[name] = conf.attrs
  end
  
end