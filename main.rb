require_relative 'data_gouv_http_handler'
require_relative 'data_gouv_parser'

puts "Please provide your address :"
address = gets.chomp
puts "Thank you. Please bear with us, this might take some time..."

response = DataGouvHTTPHandler.search(address)
parser = DataGouvParser.new(response)
puts parser.coordinates_of(address)
