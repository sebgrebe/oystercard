class Oystercard

  attr_reader :balance, :station, :journeys

  MAXIMUM_VALUE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @station = nil
    @journeys = []
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM_FARE
    @station = station
    @journeys << {entry_station: station}
  end

  def in_journey?
    @station
  end

  def touch_out(exit_station)
    @journeys[-1][:exit_station] = exit_station
    @station = nil
    deduct_money(MINIMUM_FARE)

  end

  private

  def deduct_money(amount)
    @balance -= amount
  end

end
