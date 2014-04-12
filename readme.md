## Boris Bikes project

----
Week 3 project at Makers Academy. For this project I built a system that
manages **bikes** that can by rented by persons from **docking stations**
and returned there at the end of the rental. Bikes can break while being used,
in which case they won't be available for rental once returned. There's a **van**
that takes in the broken bikes to a **garage** where they are fixed. The van can also
be used to take the fixed bikes back to the **docking station**. This project was set
by [@shadchnev](https://github.com/shadchnev)

Although not a part of our exercise, I implemented a class **person** that can rent
bikes from the station, and break them while used. Each person can only have one bike
at a time, for the fun of it I also implemented a method that allows persons to steal
bikes from each other. Technologies used:

* Ruby
* Test driven development with rspec
* Git version control
* Object-oriented-programming
* CRC (class-responsibility-collaboration) cards.

Here's a demostration on ```irb``` of the system, after loading all required files and creating
instances of all the classes previously mentioned.

Docking bikes inside a station:

```ruby
station.dock(bike)
=> [#<Bike:0x00000101a91710 @broken=false>]
station.dock(broken_bike)
=> [#<Bike:0x00000101a91710 @broken=false>, #<Bike:0x00000101ab8a18 @broken=true>]
station.available_bikes
=> [#<Bike:0x00000101a91710 @broken=false>]
```

Loading a broken bike to the van and taking it to the garage:

```ruby
van.dock(broken_bike)
=> [#<Bike:0x00000101ab8a18 @broken=true>]
van.take_broken_bikes_to(garage)
# ...
garage.bikes.count
=> 1
```

Fixing a broken bike that's in the garage:

```ruby
broken_bike
=> [#<Bike:0x00000101ab8a18 @broken=true>]
garage.repair(broken_bike)
=> [#<Bike:0x00000101ab8a18 @broken=false>]
```

**BONUS:** stealing a bike from one of the teachers:

```ruby
evgeny.has_bike?
=> true
mario.steal_bike_from(evgeny)
=> [#<Bike:0x00000101ab8a18 @broken=false>]
evgeny.has_bike?
=> false
```

Issues to be resolved:

* Person can steal a broken bike
* Docking stations can release a broken bike to a person
