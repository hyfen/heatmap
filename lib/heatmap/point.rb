module Heatmap

  class Point
    
    DEFAULT_INTENSITY = 1.0
  
    attr_accessor :x, :y, :intensity
  
    def initialize(x, y, intensity=DEFAULT_INTENSITY)
      @x = x
      @y = y
      @intensity = intensity
    end
  end
  
end