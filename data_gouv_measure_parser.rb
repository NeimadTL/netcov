require "csv"
require_relative "measure_serializer"

class DataGouvMeasureParser
  extend MeasureSerializer

  attr_reader :measures

  def initialize(file_name)
    @csv = CSV.open(file_name, "r", {headers: true, col_sep: ";"})
    @measures = []
  end

  def load_measures
    @csv.each do |row|
      measure = DataGouvMeasureParser::deserialize(row)
      @measures.push(measure)
    end
  end

end
