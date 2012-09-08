require 'spec_helper'

describe Confetti do
  
  before(:each) do
    @c = Confetti.build :dev_env do
          env :test_env do
            mail 'user@mail.ru'
            login 'login'
            attrib do 
              nam 'namnam'
            end
          end
          env :dev_env, :parent => :test_env do
            mail 'dev@mail.ru'
            order do
              date '2012-09-09'
              sum '1000'
            end
            attrib do
              nam 'nomnom'
            end
          end
        end
  end
  
  it 'check key -> val' do
    @c.mail.should eq 'dev@mail.ru'
  end
  
  it 'check nesting' do
    @c.order.sum.should eq '1000'
  end
  
  it 'check inheritance' do
    @c.login.should eq 'login'
  end
  
  it 'check inheritance' do
    @c.attrib.nam.should eq 'nomnom'
  end

end