require './lib/oystercard.rb'
oyster = Oystercard.new
oyster.balance
oyster.add_money(23)
oyster.deduct_money(9)
oyster.touch_in
oyster.in_journey?
oyster.touch_out
oyster.in_journey?

#oyster.entry_station
oyster.journeys
