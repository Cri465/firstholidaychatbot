seed_data = File.read(Rails.root.join('db', 'Data Set.csv'))
seed_data = CSV.parse(seed_data, headers: true, encoding: 'ISO-8859-1')

seed_data.each do |entry|
  # p entry['Category']
  location = Location.new
  location.hotel_name = entry["HotelName"]
  location.traits = "{activity: '#{entry['Category']||'nil'}', climate: '#{entry['TempRating']||'nil'}', location: '#{entry['Location']||'nil'}'}"
  location.geodata = "{city: '#{entry['City']||'nil'}', country: '#{entry['Country']||'nil'}', continent: '#{entry['Continent']||'nil'}'}"
  location.star_rating = entry["StarRating"]
  location.price_per_night = entry["PricePerPerNight"]
  location.save!
end
