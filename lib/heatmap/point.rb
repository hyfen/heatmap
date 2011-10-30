module Heatmap

  class Point

    DEFAULT_INTENSITY = 1.0

    attr_accessor :x, :y, :intensity

    def initialize(x, y, intensity=DEFAULT_INTENSITY)
      @x = x
      @y = y
      @intensity = intensity
    end

    def self.from_lat_lng(lat, lng, zoom, intensity=DEFAULT_INTENSITY)
      x = Heatmap::Mercator.lng_to_x(lng, zoom)
      y = Heatmap::Mercator.lat_to_y(lat, zoom)
      new(x, y, intensity)
    end
  end

end
