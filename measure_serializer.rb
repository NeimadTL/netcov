require_relative "measure"

module MeasureSerializer

  def deserialize(row)
    provider = row[0]
    x = row[1]
    y = row[2]
    second_gen = row[3]
    third_gen = row[4]
    fourth_gen = row[5]
    Measure.new(provider, x, y, second_gen, third_gen, fourth_gen)
  end

end
