require 'oystercard'

describe Oystercard do

  # it { is_expected.to respond_to(:deduct_money).with(1).argument }

  let(:station){double(:station)}
  let(:exit_station){double(:exit_station)}
  before(:each) {
    @oyster_10 = Oystercard.new
    @oyster_10.add_money(10)
  }

  it { is_expected.to respond_to(:touch_in).with(1).argument }

  it 'responds to balance' do
    expect(subject).to respond_to :balance
  end

  it 'responds to journeys' do
    expect(subject).to respond_to :journeys
  end

  it "has an empty list of journeys by default" do
    expect(subject.journeys).to be_empty
  end

  it 'expect oystercard to have default starting value of "0"' do
    expect(subject.balance).to eq(0)
  end

  describe '#add_money' do

    it 'tops up the card' do
      expect(subject.add_money(30)).to eq(subject.balance)
    end

    it 'tops up the card2' do
      expect{subject.add_money(30)}.to change{subject.balance}.from(0).to(30)
    end


    it 'expect error to be raised if top_up amount takes "balance" over 90' do
      maximum_balance = Oystercard::MAXIMUM_VALUE
      subject.add_money(maximum_balance)
      expect{subject.add_money(1)}.to raise_error("Maximum balance of #{maximum_balance} exceeded")
    end
  end

  # describe "#deduct_money" do
  #
  #
  #   it 'deducts money from card' do
  #     subject.add_money(30)
  #     expect{subject.deduct_money(9)}.to change {subject.balance}.by -9
  #
  #     expect{subject.deduct_money(9)}.to change{subject.balance}.from(30).to(21)
  #   end
  # end


  describe "#touch_in" do

    it 'can touch in' do
      @oyster_10.touch_in(station)
      expect(@oyster_10.journeys[-1].complete?).to eq(false)
    end

    it 'touch in raises error if below min balance' do
      expect { subject.touch_in(station) }.to raise_error("not enough funds")
    end

    it 'creates an instance of journey and stores it in "journeys"' do
      @oyster_10.touch_in(station)
      expect(@oyster_10.journeys[-1].from).to eq station
    end

  end

  describe "#touch_out" do

    before(:each) {
      @oyster_10.touch_in(station)
    }

    it 'can touch out' do
      @oyster_10.touch_out(exit_station)
      expect(@oyster_10.journeys[-1].complete?).to eq(true)
    end

    it "charges card on touch_out" do
      expect{@oyster_10.touch_out(exit_station)}.to change{@oyster_10.balance}.by(-described_class::MINIMUM_FARE)
    end

    it 'adds exit station as "to" in journey instance' do
      @oyster_10.touch_out(exit_station)
      expect(@oyster_10.journeys[-1].to).to eq exit_station
    end

  end

end
