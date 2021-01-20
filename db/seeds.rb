# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.destroy_all
Flight.destroy_all

airports = [['Del','Delhi'],['Blr','Bangalore'],['Mad','Chennai'],['Bom','Mumbai'],['Kol','Calcutta']]

airports.each { |port| Airport.create(name: port[1], code: port[0] ) }

routes = Array.new

airports.each_with_index do |port,i|
  until i == 4
    j = rand(1..3)
    routes << [port[0],airports[i+1][0],j]
    routes << [airports[i+1][0],port[0],j]
    i += 1
  end
end

routes.each do |route|
  3.times do
    Flight.create({from_airport_id: Airport.where(code: route[0]).take!.id, 
                   to_airport_id: Airport.where(code: route[1]).take!.id, 
                   duration: route[2].to_i, 
                   time: (Time.now+60*60*rand(-12..12)).strftime("%k:%M")})
  end
end

