require 'journey'

describe Journey do

  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station) }

  describe '#initialize'
    it { should respond_to :entry }
    it { should respond_to :exit }
    it 'allows you to pass in an entry parameter' do
      journey = described_class.new(entry_station)
      expect(journey.entry).to eq entry_station
    end

  describe '#finish'
    it 'allows you end a journey' do
      subject.finish(exit_station)
      expect(subject.exit).to eq(exit_station)
    end

  describe '#complete?'
    it 'returns true if journey has entry and exit' do
      journey = described_class.new(entry_station)
      journey.finish(exit_station)
      expect(journey).to be_complete
    end

    it 'returns false if journey has no exit' do
      journey = described_class.new(entry_station)
      expect(journey).to_not be_complete
    end

    it 'returns false if journey has no entry' do
      expect(subject).to_not be_complete
    end

  describe '#fare'
    it 'should return penalty fare when there is no entry station' do
      subject.finish(exit_station)
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
    it 'should return penalty fare when there is no exit station' do
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
    it 'should return minimum fare when journey is complete' do
      journey = Journey.new(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq described_class::MINIMUM_FARE
    end

end
