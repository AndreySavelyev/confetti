class Confetti::Config

  def initialize(hash)
    puts hash.inspect
    puts "^hash"
    hash.each do |k, v|
      define_singleton_method(k) do
        if v.is_a? Hash
          self.class.new v
        else
          v
        end
      end
    end
  end

end