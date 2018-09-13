class Journey

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  attr_reader :entry, :exit

  def initialize(entry = nil)
    @entry = entry
    @exit = nil
  end

  def finish(station)
    @exit = station
  end

  def complete?
    @entry && @exit
  end

  def fare
    return PENALTY_FARE if !complete?
    MINIMUM_FARE
  end

end
