require 'net/http'

class DataGouvHTTPHandler

  DEFAULT_URI = "https://api-adresse.data.gouv.fr"

  def self.search(query)
    uri = URI(DEFAULT_URI.concat("/search/?q=#{query}"))
    Net::HTTP.get(uri)
  end

end
