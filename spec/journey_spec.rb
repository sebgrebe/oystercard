require 'journey'
require 'oystercard'

describe Journey do

  subject { described_class.new('Kings Cross') }

  describe 'initialization'

    it 'initializes with "from" as Kings Cross' do
      expect(subject.from).to eq "Kings Cross"
    end
    it 'initializes with "to" as nil' do
      expect(subject.to).to eq nil
    end
    it 'initializes with "complete" as false' do
      expect(subject).to_not be_complete
    end

  describe '#to'
    it 'sets to variable to exit_station' do
      subject.to = 'Farringdon'
      expect(subject.to).to eq 'Farringdon'
    end

  describe '#fare' do
    it 'if journey complete - to/from - charge minimum fare' do
      subject.to = 'Farringdon'
      expect(subject.fare).to eq Oystercard::MINIMUM_FARE
    end

    it 'if journey incomplete - to/from - charge penalty fare' do
      expect(subject.fare).to eq Oystercard::PENALTY_FARE
    end
  end

  describe '#finish' do
    it 'changes complete status to true' do
      subject.finish
      expect(subject).to be_complete
    end
  end

  describe '#complete?' do
    it 'returns complete status' do
      expect(subject.complete?).to eq false
    end
  end

end
