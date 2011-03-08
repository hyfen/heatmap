module Heatmap
  class Point
    attr_accessor :x, :y, :intensity
    def initialize(x, y, intensity)
      @x = x
      @y = y
      @intensity = intensity
    end
  end
end