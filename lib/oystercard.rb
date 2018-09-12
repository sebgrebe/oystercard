require_relative 'station'

class Oystercard

  attr_reader :balance, :station, :journeys

  MAXIMUM_VALUE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM_FARE
    @journeys << {in: station}
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out(exit_station)
    @journeys[-1][:out] = exit_station
    deduct_money(MINIMUM_FARE)
    @in_journey = false
  end

  private

  def deduct_money(amount)
    @balance -= amount
  end

end
