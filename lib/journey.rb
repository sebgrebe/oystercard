require_relative 'oystercard'

class Journey

  attr_reader :from
  attr_accessor :to

  def initialize(from)
    @from = from
    @to = nil
    @complete = false
  end

  def fare
    return Oystercard::PENALTY_FARE if @to == nil
    Oystercard::MINIMUM_FARE
  end

  def finish
    @complete = true
  end

  def complete?
    @complete
  end

end
