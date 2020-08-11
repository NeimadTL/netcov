require "csv"
require_relative "measure_serializer"

class DataGouvMeasureParser
  extend MeasureSerializer

  attr_reader :measures

  def initialize(file_name)
    @csv = CSV.open(file_name, "r", {headers: true, col_sep: ";"})
    @measures = {}
  end

  def load_measures
    orange_ary, sfr_ary, free_ary, bouygue_ary = [], [], [], []
    @csv.each do |row|
      measure = DataGouvMeasureParser::deserialize(row)
      if measure.provider.eql?(Measure::PROVIDERS_TABLE.key("Orange"))
        orange_ary << measure
      elsif measure.provider.eql?(Measure::PROVIDERS_TABLE.key("SFR"))
        sfr_ary << measure
      elsif measure.provider.eql?(Measure::PROVIDERS_TABLE.key("Free"))
        free_ary << measure
      elsif measure.provider.eql?(Measure::PROVIDERS_TABLE.key("Bouygue"))
        bouygue_ary << measure
      end
    end
    @measures["20801"] = orange_ary
    @measures["20810"] = sfr_ary
    @measures["20815"] = free_ary
    @measures["20820"] = bouygue_ary
  end

end
