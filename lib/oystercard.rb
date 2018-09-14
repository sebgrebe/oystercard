require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys, :journey

  MAXIMUM_VALUE = 90

  def initialize(journey = Journey)
    @balance = 0
    @journeyClass = journey
    @journey = journey.new
    @journeys = []
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def touch_in(station)
    raise "not enough funds" if @balance < Journey::MINIMUM_FARE
    deduct_money if @journey.entry
    @journey = @journeyClass.new(station)
  end

  def touch_out(exit_station)
    @journey = @journey.finish(exit_station)
    @journeys << @journey
    deduct_money
  end

  private

  def deduct_money
    @balance -= @journey.fare
  end

end
