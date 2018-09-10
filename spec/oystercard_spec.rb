require 'oystercard'

describe Oystercard do

  # In order to use public transport
  # As a customer
  # I want money on my card

  it 'responds to balance' do
    expect(subject).to respond_to :balance
  end

  it 'expect oystercard to have default starting value of "0"' do
    expect(subject.balance).to eq(0)
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card

  describe '#add_money' do

    it 'tops up the card' do
      expect(subject.add_money(30)).to eq(subject.balance)
    end

    it 'tops up the card2' do
      expect{subject.add_money(30)}.to change{subject.balance}.from(0).to(30)
    end



  # In order to protect my money from theft or loss
  # As a customer
  # I want a maximum limit (of £90) on my card

    it 'expect error to be raised if top_up amount takes "balance" over 90' do
      maximum_balance = Oystercard::MAXIMUM_VALUE
      subject.add_money(maximum_balance)
      expect{subject.add_money(1)}.to raise_error("Maximum balance of #{maximum_balance} exceeded")
    end
  end

  # In order to pay for my journey
  # As a customer
  # I need my fare deducted from my card

  describe '#deduct_money' do

    it 'responds to deduct money' do
      expect(subject).to respond_to :deduct_money
    end

    # it 'deducts money from card'
    #   subject.balance = 30
    #   expect{subject.deduct_money(9)}.to change{subject.balance}.from(30).to(21)
    # end

  end

end
