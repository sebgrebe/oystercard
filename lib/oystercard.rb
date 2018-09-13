require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey

  MAXIMUM_VALUE = 90

  def initialize(journey = Journey.new)
    @balance = 0
    @journey = journey
    @journeys = []
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station, journey = Journey)
    raise "not enough funds" if @balance < Journey::MINIMUM_FARE
    deduct_money if @journey.entry
    @journey = journey.new(station)
  end

  def touch_out(exit_station)
    @journey.finish(exit_station)
    deduct_money
  end

  private

  def deduct_money
    @balance -= @journey.fare
  end

end
