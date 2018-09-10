require 'oystercard'

describe Oystercard do

  it 'responds to balance' do
    expect(subject).to respond_to :balance
  end

  it 'expect oystercard to have default starting value of "0"' do
    expect(subject.balance).to eq(0)
  end

  it 'tops up the card' do
    expect(subject.add_money(30).to eq(subject.balance))
  end

end
