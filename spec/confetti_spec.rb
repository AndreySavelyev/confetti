require 'spec_helper'

describe Confetti do
  
  before(:each) do
    @c = Confetti.build :test_env do
          env :test_env do
            mail 'user@mail.ru'
          end
        end
  end
  
  it 'check key -> val' do
    @c.mail.should eq 'user@mail.ru'
  end


end