# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parks = Unirest.get("http://data.cityofchicago.org/resource/wwy2-k7b3.json").body

parks.each do |park|
	begin
		Park.create(:name => park["park_name"], :park_number => park["park_number"], :street_address => park["street_address"], :zip => park["zip"], :acres => park["acres"], :ward => park["ward"], :park_class => park["park_class"], :lat => park["location"]["latitude"], :lng => park["location"]["longitude"])
		number_of_basketball_courts = park["basketball_courts"].to_i
		puts number_of_basketball_courts
		number_of_basketball_courts.times do
			puts "HA!"
			Court.create(:sport_id => 1, :park_id => park["park_number"].to_i)
		end

	rescue
	end

end
puts "DONE!"
