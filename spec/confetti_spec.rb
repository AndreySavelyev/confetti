require 'spec_helper'

describe Confetti do
  
  before(:each) do
    @c = Confetti.build :test_env do
          env :test_env do
            mail 'user@mail.ru'
            order do
              date '2012-09-09'
              sum '1000'
            end
          end
        end
  end
  
  it 'check key -> val' do
    @c.mail.should eq 'user@mail.ru'
  end
  
  it 'check nesting' do
    puts "blabla"
    @c.order.sum.should eq '1000'
  end

end