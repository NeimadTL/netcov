require_relative 'data_gouv_api_handler'
require_relative 'data_gouv_api_parser'

puts "Please provide your address :"
address = gets.chomp
puts "Thank you. Please bear with us, this might take some time..."

response = DataGouvApiHandler.search(address)
parser = DataGouvApiParser.new(response)
puts parser.coordinates_of(address)
