require_relative 'data_gouv_http_handler'
require_relative 'data_gouv_api_parser'
require_relative 'data_gouv_measure_parser'
require_relative 'network_coverage_matcher'

puts "Please provide your address :"
address = gets.chomp
puts "Thank you. Please bear with us, this might take some time..."

response = DataGouvHTTPHandler.search(address)
parser = DataGouvAPIParser.new(response)
coordinates = parser.coordinates_of(address)


measureParser = DataGouvMeasureParser.new("2018_01_Sites_mobiles_2G_3G_4G_France_metropolitaine_L93.csv")
measureParser.load_measures

result = NetworkCoverageMatcher.match(coordinates, measureParser.measures)
result.each do |key, value|
  puts value
end
