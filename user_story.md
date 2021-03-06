# User Stories

### Part 1:

As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working


### Part 2:

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

### Part 3:

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.


### Part 4:
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

### Part 5:
As a system maintainer,
So that busy areas can be served more effectively,
I want to be able to specify a larger capacity when necessary.

### Part 6:

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

### Domain Model:

Nouns:
- Person
- Bike
- Docking station

Verbs:
- Release bike
- Working bike
- Use bike

| Objects          | Messages                              |
| ---              | ---                                   |
| Person           |                                       |
| Bike             | working?, dock                        |
| Docking Station  | release_bike, return_bike, any_bikes? |

Domain Model:

Docking Station <-- release_bike --> Get Bike from Docking Station

Bike <-- working_bike --> true/false?

Bike <-- dock --> Return Bike to Docking Station

Docking Station <-- return_bike --> Adds 1 to number of bikes at Docking Station

Docking Station <-- any_bikes --> true/false?
