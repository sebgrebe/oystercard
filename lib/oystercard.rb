class Oystercard

  attr_reader :balance
  attr_accessor :touched

  MAXIMUM_VALUE = 90

  def initialize
    @balance = 0
    @touched = touched
  end

  def add_money(amount)

    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount

  end

  def deduct_money(amount)
    @balance -= amount
  end

  def touch_in
    @touched = true
  end

  def in_journey?
    @touched == true ? true : false
  end

  def touch_out
    @touched = false
  end

end
