

@addresses = ["25 Rue des Francs Bourgeois","2 place michel debré", "69 rue de turbigo", "1 avenue de la republique", "78 boulevard des batignolles", "23 place de la chapelle", "82 boulevard diderot", "46 rue fondary", "91 rue de l'universite", "3 place de clichy", "107 rue caulaincourt", "150 rue la fayette", "100 rue la fayette", "90 rue la fayette", "72 rue de vouillé"]


# seeds users with a 50x50 avatar, a name , password (md5) and email.
puts "startin my seed"
puts "seeding 50 users"
50.times do
  User.create!(name:"#{Faker::Name.name}", password:"#{Faker::Crypto.md5}", email:"#{Faker::Internet.email}", avatar:"")
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
  rand(1..10)
end
puts "now seeding friends"
# seeds 150 friends with an avatar a description, a price , a name, a picture and a user id,adding an activity tag;
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"66 avenue du marechal foch", latitude: 3.097987 , longitude: 50.671254 , zip_code:"59700", country: "France", city:"MARCQ-EN-BAROEUL")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"Boulevard de l'alliance nord-ouest", latitude: 3.029422 , longitude: 50.656133 , zip_code:"59130", country: "France", city:"LAMBERSART")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"92 rue georges potie", latitude: 3.002128  , longitude: 50.612690 , zip_code:"59120", country: "France", city:"LOOS")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"94 rue de lannoy", latitude: 3.098258 , longitude: 50.634362 , zip_code:"59800", country: "France", city:"LILLE")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"68 boulevard victor hugo", latitude: 3.064269 , longitude: 50.623147 , zip_code:"59000", country: "France", city:"LILLE")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"42 rue du ballon", latitude: 3.084354 , longitude: 50.647426 , zip_code:"59800", country: "France", city:"LILLE")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"40 avenue du marechal foch", latitude: 3.028478 , longitude: 50.648678 , zip_code:"59130", country: "France", city:"LAMBERSART")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"49 avenue du president kennedy", latitude: 3.011484 , longitude: 50.651399 , zip_code:"59130", country: "France", city:"LAMBERSART")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"157 rue jules guesde", latitude: 3.008136 , longitude: 50.638772 , zip_code:"59160", country: "France", city:"LILLE")
  Friend.create!(avatar_x:"",description:"#{Faker::HowIMetYourMother.quote}",price:"#{rand(1..10000)}",name:"#{Faker::Name.name}",pictures:"", user_id: user, activity_id: activity, address:"51 avenue de boufflers", latitude: 3.020496 , longitude: 50.643834 , zip_code:"59130", country: "France", city:"LAMBERSART")
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
