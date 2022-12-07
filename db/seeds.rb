seed_data = File.read(Rails.root.join('db', 'Data Set.csv'))
seed_data = CSV.parse(seed_data, headers: true, encoding: 'ISO-8859-1')

seed_data.each do |entry|
  # p entry['Category']
  location = Location.new
  location.hotel_name = entry["HotelName"]
  location.tags = "{Activity: '#{entry['Category']||'nil'}', Climate: '#{entry['TempRating']||'nil'}', Setting: '#{entry['Location']||'nil'}'}"
  location.geodata = "{City: '#{entry['City']||'nil'}', Country: '#{entry['Country']||'nil'}', Continent: '#{entry['Continent']||'nil'}'}"
  location.star_rating = entry["StarRating"]
  location.save!
end
