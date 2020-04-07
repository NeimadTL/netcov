require "minitest/autorun"
require_relative 'data_gouv_api_handler'
require_relative "data_gouv_api_parser"


describe DataGouvApiParser do

  before do
    @address = "157 Boulevard Macdonald 75019 Paris"
    response = DataGouvApiHandler.search("157 Boulevard Macdonald 75019 Paris")
    @parser = DataGouvApiParser.new(response)
  end

  it "#feature_count must equal 1" do
    _(@parser.features_count).must_equal(1)
  end

  it "#features must return the right data" do
    _(@parser.features[0]["geometry"]["coordinates"][0]).must_equal(2.378185)
    _(@parser.features[0]["geometry"]["coordinates"][1]).must_equal(48.898595)
    _(@parser.features[0]["properties"]["housenumber"]).must_equal("157")
    _(@parser.features[0]["properties"]["district"]).must_equal("Paris 19e Arrondissement")
  end

  it "#coordinates_of must return the right coordinates for a particular address" do
    _(@parser.coordinates_of(@address)["x"]).must_equal(654412.38)
    _(@parser.coordinates_of(@address)["y"]).must_equal(6866689.48)
  end

end
