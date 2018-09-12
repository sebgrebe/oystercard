require_relative 'station'

class Oystercard

  attr_reader :balance, :station, :journeys

  MAXIMUM_VALUE = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journeys = []
  end

  def add_money(amount)
    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM_FARE
    @journeys << Journey.new(station)
  end

  def touch_out(exit_station)
    @journeys[-1].to = exit_station
    deduct_money(MINIMUM_FARE)
    @journeys[-1].finish
  end

  private

  def deduct_money(amount)
    @balance -= amount
  end

end
