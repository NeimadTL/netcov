require_relative 'data_gouv_http_handler'
require_relative 'data_gouv_api_parser'
require_relative 'data_gouv_measure_parser'

puts "Please provide your address :"
address = gets.chomp
puts "Thank you. Please bear with us, this might take some time..."

response = DataGouvHTTPHandler.search(address)
parser = DataGouvAPIParser.new(response)
coordinates = parser.coordinates_of(address)
coordinate_x = coordinates["x"].truncate
coordinate_y = coordinates["y"].truncate
puts coordinate_x


measureParser = DataGouvMeasureParser.new("2018_01_Sites_mobiles_2G_3G_4G_France_metropolitaine_L93.csv")
measureParser.load_measures

match = false
measureParser.measures["20801"].each do |measure|
  puts measure.x.class
  if coordinate_x == measure.x.to_i
    match = true
  end
end
unless match
  puts "no match sor far, searching hard"
  for i in coordinate_x..coordinate_x+100
    measureParser.measures["20801"].each do |measure|
      if i == measure.x.to_i
        match = true
        break
      end
    end
  end
end
if match
  puts "found"
else
  puts "couldn't find anything sorry"
end
