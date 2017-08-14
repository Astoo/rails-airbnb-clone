
# seeds users with a 50x50 avatar, a name , password (md5) and email.
puts "startin my seed"
puts "seeding 150 users"
150.times do
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
  rand(1..150)
end

def friend
  rand(1..75)
end
puts "now seeding friends"
# seeds 75 friends with an avatar a description, a price , a name, a picture and a user id,adding an activity tag;
75.times do
  Friend.create!(avatar:"#{Faker::Avatar.image("my-own-slug", "50x50")}",description:"#{Faker::HowIMetYourMother.quote}",price:("#{rand(1..10000)}"),name:"#{Faker::Name.name}",pictures:"#{Faker::Avatar.image}", user_id: user, activity_id: activity)
end
puts "finished with the friends"
puts "now creating reviews"
100.times do
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
100.times do
  Booking.create!(friend_id: friend, user_id: user , status: bookingstatus, date: "#{Faker::Date}", start_date: "#{Faker::Date.forward(23)}", end_date: "#{Faker::Date.forward(50)}")
end
puts "finished adding bookings"
puts " FINISHED SPREADIN MY SEED!!!"
