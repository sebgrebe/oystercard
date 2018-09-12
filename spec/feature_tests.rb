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

In order to know where I have been
As a customer
I want to see all my previous trips

in irb
  require './lib/oystercard.rb'
  oyster = Oystercard.new
  oyster.touch_in('station')
  oyster.touch_out('exit_station')
  oyster.journeys == [{
    entry_station: 'station',
    exit_station: 'exit_station'
    }]

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

in irb
  require './lib/oystercard.rb'
  station = Station.new('Farringdon', 1)
  station.name == 'Farringdon'
  station.zone == 1
