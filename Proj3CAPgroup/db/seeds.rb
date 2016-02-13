# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.create([
  {name: "Phil", password: "password", email: "a@gmail.com", avatar: "" },
  {name: "John", password: "password", email: "test@gmail.com", avatar: "https://upload.wikimedia.org/wikipedia/en/5/55/Xbox_NXE_avatar.png" },
  {name: "Sir Robert Testingson the Third Esqire", password: "password", email: "pippipcheeriohuzzzah@veryverylongname.com", avatar: "http://ecx.images-amazon.com/images/I/51I6k%2BNGMTL._SY300_.jpg" },
  {name: "Admin", password: "password", email: "test@test.com", avatar: "http://www.ideaminetech.com/images/s_pic2.jpg" }
  ])  

Location.create([
  {location_name: "Home!", address: "200 W 21st St New York, NY 10011", home: true , work: false , favorite: true , default_transport: "bicycling", user_id: 1},
  {location_name: "My Crib", address: "1507 York Ave ,New York, NY 10075" , home: true , work: false , favorite: true , default_transport: "car", user_id: 2},
  {location_name: "Home", address: "71 Kissena Blvd, Queens, NY , 11367" , home: true , work: false , favorite: true , default_transport: "transit", user_id: 3},
  {location_name: "Home", address: "151 W 16th St, New York, NY, 10011" , home: true , work: false , favorite: true , default_transport: "car", user_id: 4},
  {location_name: "Work", address: "56 Booth St, Queens,  NY,11374" , home: false , work: true , favorite: true , default_transport: "bicycling", user_id: 1},
  {location_name: "My Work", address: "10 East 21st Street,  New York, NY, 10010" , home: false , work: true, favorite: true , default_transport: "car", user_id: 2},
  {location_name: "Workplace", address: "131 Cleveland Ave,  Long Beach,  NY,  11561" , home: false , work: true , favorite: true , default_transport: "bicyling", user_id: 3},
  {location_name: "Work", address: "975 Sherman Ave,  Bronx, NY, 10456" , home: false , work: true , favorite: true , default_transport: "car", user_id: 4},
  {location_name: "General Assembly", address: "10 East 21st Street, New York, NY, 10010" , home: false , work: false, favorite: true , default_transport: "walking", user_id: 1},
  {location_name: "Phil's House", address: "200 W 21st St, New York,  NY, 10011" , home: false , work: false , favorite: true , default_transport: "transit", user_id: 2},
  {location_name: "Corner Deli", address: "1624 2nd Ave,, New York, NY, 10028" , home: false , work: false , favorite: true , default_transport: "car", user_id: 3},
  {location_name: "TwoBros Pizza", address: "601 Ave of the Americas,  New York, NY, 10011" , home:  false, work: false , favorite: false , default_transport: "walking", user_id: 4},
  {location_name: "Liberty State Park", address: "1 Audrey Zapp Drive, Jersey City, NJ, 07305" , home: false , work: false , favorite: true , default_transport: "car", user_id: 1},
  {location_name: "Union Square", address: "69 E 17th St, New York, NY, 10003" , home: false , work: false , favorite: true , default_transport: "transit", user_id: 2},
  {location_name: "Empire State Building", address: "350 5th Ave,  New York,  NY, 10118" , home: false , work: false , favorite: true , default_transport: "car", user_id: 3},
  {location_name: "Freedom Tower", address: "One World Trade Center, city: New York, NY", zip: 10007 , home: false , work: false , favorite: true , default_transport: "transit", user_id: 4},
  {location_name: "Cornell University", address: "Cornell University, Ithaca,  NY, 14850", home: false , work: false , favorite: false , default_transport: "car", user_id: 3},
  ])  
