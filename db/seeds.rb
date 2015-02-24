# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sport.create!([{ id: 1, name: 'Basketball' }, { id: 2, name: 'Soccer' }, { id: 3,name: 'Baseball' }, { id: 4, name: 'Volleyball' }, { id: 5, name: 'Tennis' }])


parks = Unirest.get("http://data.cityofchicago.org/resource/wwy2-k7b3.json").body

parks.each do |park|
	begin
		Park.create(:name => park["park_name"], :park_number => park["park_number"], :street_address => park["street_address"], :zip => park["zip"], :acres => park["acres"], :ward => park["ward"], :park_class => park["park_class"], :lat => park["location"]["latitude"], :lng => park["location"]["longitude"])
		
		number_of_basketball_courts = park["basketball_courts"].to_i
		number_of_basketball_courts.times do
			Court.create(:sport_id => 1, :park_id => park["park_number"].to_i)
		end

		number_of_soccer_fields = park["footbal_soccer_combo"].to_i
		number_of_soccer_fields.times do
			Court.create(:sport_id => 2, :park_id => park["park_number"].to_i)
		end

		number_of_soccer_fields_2 = park["artificial_turf_fields"].to_i
		number_of_soccer_fields_2.times do
			Court.create(:sport_id => 2, :park_id => park["park_number"].to_i)
		end

		number_of_baseball_fields = park["baseball_sr"].to_i
		number_of_baseball_fields.times do
			Court.create(:sport_id => 3, :park_id => park["park_number"].to_i)
		end

		number_of_volleyball_courts = park["volleyball_sand"].to_i
		number_of_volleyball_courts.times do
			Court.create(:sport_id => 4, :park_id => park["park_number"].to_i)
		end

		number_of_volleyball_courts_2 = park["volleyball"].to_i
		number_of_volleyball_courts_2.times do
			Court.create(:sport_id => 4, :park_id => park["park_number"].to_i)
		end
		
		number_of_tennis_courts = park["tennis_courts"].to_i
		number_of_tennis_courts.times do
			Court.create(:sport_id => 5, :park_id => park["park_number"].to_i)
		end


	rescue
end

end
puts "Parks and Sports Seeded!  Your database should be ready to roll."
