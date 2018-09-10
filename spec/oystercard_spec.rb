require 'oystercard'

describe Oystercard do
  
  it 'expect oystercard to have default starting value of "0"' do
    expect(subject.balance).to eq(0)
  end

end