class Confetti::ConfItem
  attr_reader :attrs
  
  def self.build(&bl)
    item = new &bl
    item.attrs
  end

  def initialize(&blk)
    @attrs = {}
    instance_eval &blk
  end
  
  def method_missing(name, value = nil, &block)
    if block_given?
      @attrs[name] = self.class.build &block
    else
      @attrs[name] = value
    end
  end

end