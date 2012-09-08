class Confetti::ConfItem < BasicObject
  attr_reader :attrs
  
  def self.build(&bl)
    new &bl
  end

  def initialize(&blk)
    @attrs = {}
    instance_eval &blk
  end
  
  def method_missing(name, *args)
    # if block_given?
    #   Confetti::ConfItem.build arg
    # else
      @attrs[name] = args.last
    # end 
  end

end