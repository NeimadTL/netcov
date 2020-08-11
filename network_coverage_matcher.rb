require_relative "measure"

class NetworkCoverageMatcher
  class << self
    def match(coordinates, measures)
      {
        "Orange" => match_for(Measure::PROVIDERS_TABLE.key("Orange"), coordinates, measures),
        "SFR" => match_for(Measure::PROVIDERS_TABLE.key("SFR"), coordinates, measures),
        "Free" => match_for(Measure::PROVIDERS_TABLE.key("Free"), coordinates, measures),
        "Bouygue" => match_for(Measure::PROVIDERS_TABLE.key("Bouygue"), coordinates, measures)
      }
    end

    private
      def match_for(provider_key, coordinates, measures)
        coordinate_x = coordinates["x"].truncate
        coordinate_y = coordinates["y"].truncate
        match = false
        measures[provider_key].each do |measure|
          if coordinate_x == measure.x.to_i
            return measure
          end
        end
        unless match
          puts "no match sor far, still searching..."
          for i in coordinate_x..coordinate_x+100
            measures[provider_key].each do |measure|
              if i == measure.x.to_i
                return measure
              end
            end
          end
        end
        nil
      end
  end
end
