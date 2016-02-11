# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create([
  {name: "Phil", password_digest: "password", email: "a@gmail.com", avatar: "" },
  {name: "John", password_digest: "password", email: "test@gmail.com", avatar: "https://upload.wikimedia.org/wikipedia/en/5/55/Xbox_NXE_avatar.png" },
  {name: "Sir Robert Testingson the Third Esqire", password_digest: "password", email: "pippipcheeriohuzzzah@veryverylongname.com", avatar: "http://ecx.images-amazon.com/images/I/51I6k%2BNGMTL._SY300_.jpg" },
  {name: "Admin", password_digest: "password", email: "test@test.com", avatar: "http://www.ideaminetech.com/images/s_pic2.jpg" }
  ])  

Destination.create([
  {location_name: "Home!", address: "200 W 21st St", city: "New York", state: "NY", zip: 10011 , home: true , work: false , favorite: true , default_transport: "bicycling", user_id: 1},
  {location_name: "My Crib", address: "1507 York Ave", city: "New York", state: "NY", zip: 10075 , home: true , work: false , favorite: true , default_transport: "car", user_id: 2},
  {location_name: "Home", address: "71 Kissena Blvd", city: "Queens", state: "NY", zip: 11367 , home: true , work: false , favorite: true , default_transport: "transit", user_id: 3},
  {location_name: "Home", address: "151 W 16th St", city: "New York", state: "NY", zip: 10011 , home: true , work: false , favorite: true , default_transport: "car", user_id: 4},
  {location_name: "Work", address: "56 Booth St", city: "Queens", state: "NY", zip: 11374 , home: false , work: true , favorite: true , default_transport: "bicycling", user_id: 1},
  {location_name: "My Work", address: "10 East 21st Street", city: "New York", state: "NY", zip: 10010 , home: false , work: true, favorite: true , default_transport: "car", user_id: 2},
  {location_name: "Workplace", address: "131 Cleveland Ave", city: "Long Beach", state: "NY", zip: 11561 , home: false , work: true , favorite: true , default_transport: "bicyling", user_id: 3},
  {location_name: "Work", address: "975 Sherman Ave", city: "Bronx", state: "NY", zip: 10456 , home: false , work: true , favorite: true , default_transport: "car", user_id: 4},
  {location_name: "General Assembly", address: "10 East 21st Street", city: "New York", state: "NY", zip: 10010 , home: false , work: false, favorite: true , default_transport: "walking", user_id: 1},
  {location_name: "Phil's House", address: "200 W 21st St", city: "New York", state: "NY", zip: 10011 , home: false , work: false , favorite: true , default_transport: "transit", user_id: 2},
  {location_name: "Corner Deli", address: "1624 2nd Ave,", city: "New York", state: "NY", zip: 10028 , home: false , work: false , favorite: true , default_transport: "car", user_id: 3},
  {location_name: "TwoBros Pizza", address: "601 Ave of the Americas #1", city: "New York", state: "NY", zip: 10011 , home:  false, work: false , favorite: false , default_transport: "walking", user_id: 4},
  {location_name: "Liberty State Park", address: "1 Audrey Zapp Drive", city: "Jersey City", state: "NJ", zip: 07305 , home: false , work: false , favorite: true , default_transport: "car", user_id: 1},
  {location_name: "Union Square", address: "69 E 17th St", city: "New York", state: "NY", zip: 10003 , home: false , work: false , favorite: true , default_transport: "transit", user_id: 2},
  {location_name: "Empire State Building", address: "350 5th Ave", city: "New York", state: "NY", zip: 10118 , home: false , work: false , favorite: true , default_transport: "car", user_id: 3},
  {location_name: "Freedom Tower", address: "One World Trade Center", city: "New York", state: "NY", zip: 10007 , home: false , work: false , favorite:  , default_transport: "transit", user_id: 4},
  {location_name: "Cornell University", address: "Cornell University", city: "Ithaca", state: "NY", zip: 14850, home: false , work: false , favorite: false , default_transport: "car", user_id: 3},
  ])  