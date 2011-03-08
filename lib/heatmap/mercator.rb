module Heatmap
  # From https://gist.github.com/20688

  # This is a port of the javascript code found in the following link
  #http://groups.google.com/group/Google-Maps-API/browse_thread/thread/a45947d72c27cc73

  class Mercator
    #offset is defined at zoom level 21 which means that this Mercator is valid for 21 zoom levels
    OFFSET = 268435456
    RADIUS = OFFSET / Math::PI
  
    def self.lng_to_x(lng, zoom)
      (OFFSET + RADIUS * lng * Math::PI / 180).to_i >> (21 - zoom)
    end
  
    def self.lat_to_y(lat, zoom)
      (OFFSET-RADIUS*Math.log((1+Math.sin(lat*Math::PI/180))/(1-Math.sin(lat*Math::PI/180)))/2).to_i >> (21 - zoom)
    end

    def self.x_to_lng(x, zoom)
      (((x<<(21 - zoom))-OFFSET)/RADIUS)*180/Math::PI
    end
  
    def self.y_to_lat(y, zoom)
      (Math::PI/2-2*Math.atan(Math.exp(((y<< (21 - zoom))-OFFSET)/RADIUS)))*180/Math::PI
    end
  end

end