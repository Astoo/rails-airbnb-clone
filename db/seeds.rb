

@addresses = ["113 Avenue de la République 59160","42 Rue Vielle 59130 Lambersart","38 Rue du Dr Legay 59110","62 Rue de Cambrai 59000","2 Avenue des Saules 59160 Lille", "11 Rue du Bas Liévin 59790 Ronchin", "171 Rue des Stations 59000 Lille", "8 Avenue Ste Cécile 59370 Mons-en-Baroeul", "29T Rue d'Antin 59800 Lille", "44 Rue Turgot 59000 Lille","173 Rue Anatole France 59160 Lille", "92 Rue Jacquart 59160 Lille", "36 Rue Colbert 59800 Lille","114 Boulevard Vauban 59800 Lille", "32B Rue du Ballon 59800 Lille", "Epine Mont de Terre 59800 Lille", "6 Rue Léonard Danel 59120 Loos", "23 Rue Gosselin 59800 Lille", "114 Rue Colbert 59800 Lille", "2 Rue Charles Pranard 59000 Lille"]


# seeds users with a 50x50 avatar, a name , password (md5) and email.
puts "startin my seed"
puts "seeding 50 users"
50.times do
  User.create!(name:"#{Faker::Name.name}", password:"#{Faker::Crypto.md5}", email:"#{Faker::Internet.email}", avatar:"#{Faker::Avatar.image("my-own-slug", "50x50")}")
end
puts "finished seeding 150 users"
puts "now seeding some activities"
# seeds 10 activity types
Activity.create!(title:"Geek")
Activity.create!(title:"Sports")
Activity.create!(title:"Eating")
Activity.create!(title:"Drugs")
Activity.create!(title:"Walks")
Activity.create!(title:"Fun buddy ;)")
puts "finished seeding activities"
#defining method to generate random friend and user ids
def activity
  rand(1..6)
end

def user
  rand(1..50)
end

def friend
  rand(1..30)
end
puts "now seeding friends"
# seeds 150 friends with an avatar a description, a price , a name, a picture and a user id,adding an activity tag;
30.times do
  Friend.create!(avatar:"#{Faker::Avatar.image("my-own-slug", "50x50")}",description:"#{Faker::HowIMetYourMother.quote}",price:("#{rand(1..10000)}"),name:"#{Faker::Name.name}",pictures:"#{Faker::Avatar.image}", user_id: user, activity_id: activity, address: "#{@addresses.sample}")
end
puts "finished with the friends"
puts "now creating reviews"
45.times do
  Review.create!(friend_id: friend , user_id: user ,comment:"#{Faker::FamilyGuy.quote}",rating:"#{rand(0..5)}")
end
puts "finished seeding reviews"
puts "creating bookings"
#creating 100 bookings with a random status, a user_id , a friend_id , a date, a random start and end date.
#definging a method to return random status
def bookingstatus
  status = ["Pending", "Accepted", "Rejected"]
  status.sample
end
# WILL RUN INTO ISSUES WITH START AND END DATE NOT BEING RELATED. TODO
20.times do
  Booking.create!(friend_id: friend, user_id: user , status: bookingstatus, date: "#{Faker::Date}", start_date: "#{Faker::Date.forward(23)}", end_date: "#{Faker::Date.forward(50)}")
end
puts "finished adding bookings"
puts " FINISHED SPREADIN MY SEED!!!"
