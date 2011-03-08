module Heatmap

  class Point
  
    attr_accessor :x, :y, :intensity
  
    def initialize(x, y, intensity=1)
      @x = x
      @y = y
      @intensity = intensity
    end
  end
  
end