class Confetti::Builder
  attr_reader :config
  
  def self.build(env, &bl)
    builder = new env, &bl
    builder.config
  end
  
  def initialize(env, &blk)
    @env = env
    @envs = {}
    @hierarchy = {}
    instance_eval &blk
    
    attrs = resolve_inheritance(env)
    
    @config = Confetti::Config.new attrs
  end

  def env(name, inher = {},  &blk)
    @hierarchy[name] = inher[:parent] if inher[:parent]
    conf = Confetti::ConfItem.build &blk
    @envs[name] = conf
  end
  
  def resolve_inheritance(env)
    if @hierarchy[env]
      parent_attrs = @envs[@hierarchy[env]]
      child_attrs = @envs[env]
      parent_attrs.merge! child_attrs
      parent_attrs
    else
      @envs[env]
    end
  end
  
end