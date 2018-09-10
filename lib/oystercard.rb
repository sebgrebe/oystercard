class Oystercard

  attr_reader :balance

  MAXIMUM_VALUE = 90

  def initialize
    @balance = 0
  end

  def add_money(amount)
    # test_bal = @balance + amount
    fail("Maximum balance of #{MAXIMUM_VALUE} exceeded") if amount + balance > MAXIMUM_VALUE
    @balance += amount
  end

end
