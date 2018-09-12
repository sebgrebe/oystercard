require 'station'

describe Station do

  describe '#initialization'
    station = Station.new('Farringdon',1)

    it 'initializes with name' do
      expect(station.name).to eq 'Farringdon'
    end

    it 'initialize with zone' do
      expect(station.zone).to eq 1
    end

end
