module Heatmap
  require 'heatmap/map'
  require 'heatmap/version'
  require 'heatmap/mercator'
  require 'heatmap/point'  
end

h = Heatmap::Map.new(100, 100)
p = Heatmap::Point.new(2, 4, 0.8)