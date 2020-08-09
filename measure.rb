class Measure

  PROVIDERS_TABLE = {
    "20801" => "Orange",
    "20810" => "SFR",
    "20815" => "Free",
    "20820" => "Bouygue"
  }

  BOOLEANS_TABLE = {"0" => false, "1" => "true"}

  attr_reader :provider, :x, :y

  def initialize(provider, x, y, second_gen, third_gen, fourth_gen)
    @provider = provider
    @x = x
    @y = y
    @second_gen = second_gen
    @third_gen = third_gen
    @fourth_gen = fourth_gen
  end

  def to_s
    "#{PROVIDERS_TABLE[@provider]}, x:#{@x}, y:#{@y}, 2G:#{BOOLEANS_TABLE[@second_gen]}, 3G:#{BOOLEANS_TABLE[@third_gen]}, 4G:#{BOOLEANS_TABLE[@fourth_gen]}"
  end

end
