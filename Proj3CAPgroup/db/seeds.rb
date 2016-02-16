# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.create([
  {name: "Phil", password: "password", email: "a@gmail.com" },
  {name: "John", password: "password", email: "test@gmail.com" },
  {name: "Sir Robert Testingson the Third Esqire", password: "password", email: "pippipcheeriohuzzzah@veryverylongname.com" },
  {name: "Admin", password: "password", email: "test@test.com" }
  ])  

Location.create([
  {location_name: "Home!", address: "200 W 21st St New York, NY 10011", default_transport: "bicycling", user_id: 1},
  {location_name: "My Crib", address: "1507 York Ave ,New York, NY 10075" , default_transport: "car", user_id: 2},
  {location_name: "Home", address: "71 Kissena Blvd, Queens, NY , 11367" , default_transport: "transit", user_id: 3},
  {location_name: "Home", address: "151 W 16th St, New York, NY, 10011" , default_transport: "car", user_id: 4},
  {location_name: "Work", address: "56 Booth St, Queens,  NY,11374" , default_transport: "bicycling", user_id: 1},
  {location_name: "My Work", address: "10 East 21st Street,  New York, NY, 10010" , default_transport: "car", user_id: 2},
  {location_name: "Workplace", address: "131 Cleveland Ave,  Long Beach,  NY,  11561" , default_transport: "bicyling", user_id: 3},
  {location_name: "Work", address: "975 Sherman Ave,  Bronx, NY, 10456" , default_transport: "car", user_id: 4},
  {location_name: "General Assembly", address: "10 East 21st Street, New York, NY, 10010" , default_transport: "walking", user_id: 1},
  {location_name: "Phil's House", address: "200 W 21st St, New York,  NY, 10011" , default_transport: "transit", user_id: 2},
  {location_name: "Corner Deli", address: "1624 2nd Ave,, New York, NY, 10028" , default_transport: "car", user_id: 3},
  {location_name: "TwoBros Pizza", address: "601 Ave of the Americas,  New York, NY, 10011" , default_transport: "walking", user_id: 4},
  {location_name: "Liberty State Park", address: "1 Audrey Zapp Drive, Jersey City, NJ, 07305" , default_transport: "car", user_id: 1},
  {location_name: "Union Square", address: "69 E 17th St, New York, NY, 10003" , default_transport: "transit", user_id: 2},
  {location_name: "Empire State Building", address: "350 5th Ave,  New York,  NY, 10118" , default_transport: "car", user_id: 3},
  {location_name: "Freedom Tower", address: "One World Trade Center, city: New York, NY , 10007" , default_transport: "transit", user_id: 4},
  {location_name: "Cornell University", address: "Cornell University, Ithaca,  NY, 14850", default_transport: "car", user_id: 3},
  {location_name: "Watering Hole Bar", address: "106 E 19th St, New York, NY 10003", default_transport: "car", user_id: 4},
  ])  
