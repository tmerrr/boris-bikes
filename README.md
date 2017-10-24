# Boris Bikes

As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

Nouns:
- Person
- Bike
- Docking station

Verbs:
- Release bike
- Working bike
- Use bike

| Objects   | Messages     |
| ---       | ---          |
| Person    |              |
| Bike      | working_bike |
| Docking   | release_bike |

Domain Model:

Docking Station <-- release_bike --> new Bike

Bike <-- working_bike --> true/false?
