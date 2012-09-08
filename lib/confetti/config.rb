class Confetti::Config < Object

  def initialize(hash)
    puts hash.inspect
    puts "^hash"
    hash.each do |k, v|
      define_singleton_method(k) do
        v
      end
    end
  end

end