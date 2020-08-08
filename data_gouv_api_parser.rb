require 'json'

class DataGouvAPIParser

  def initialize(response)
    @data = JSON.parse(response)
  end

  def features_count
    @data["features"].count
  end

  def features
    @data["features"]
  end

  def coordinates_of(address)
    coordinates = {}
    features.each do |feature|
       if address.match(feature["properties"]["label"])
         coordinates["x"] = feature["properties"]["x"]
         coordinates["y"] = feature["properties"]["y"]
       end
    end
    coordinates
  end

end
