module Heatmap

  require 'rmagick'

  class Map
    ASSET_DIR = File.expand_path(File.join(File.dirname(__FILE__), '../..', 'examples'))
    DEFAULT_DOT_IMAGE = File.join(ASSET_DIR, "dots", "dot.png")
    DEFAULT_CLUT_IMAGE = File.join(ASSET_DIR, "gradients", "classic.png")
    DEFAULT_OUTPUT_FILE = "output.png"
    
    attr_reader :width, :height
    attr_accessor :points

    def initialize()
      @points = []
    end

    def dot_image=(dot_image)
      @dot_image_file = Magick::Image.read(dot_image)[0] if File.exists?(dot_image)
    end
    
    def clut_image=(clut_image)
      @clut_image_file = Magick::Image.read(clut_image)[0] if File.exists?(clut_image)
    end      

    def output(filename=DEFAULT_OUTPUT_FILE)
      @dot_image_file || self.dot_image=DEFAULT_DOT_IMAGE
      @width, @height = self.points_bounds
      @heatmap = Magick::Image.new(@width, @height)
      generate_map
      colorize
      @heatmap.write(filename)
    end
        
    protected

    def generate_map
      @points.each do |point|
        @heatmap = @heatmap.dissolve(@dot_image_file, point.intensity, 1, Magick::NorthWestGravity, point.x, point.y)
      end
    end
    
    def colorize
      @clut_image_file || self.clut_image=(DEFAULT_CLUT_IMAGE)
      @heatmap.clut_channel(@clut_image_file, Magick::AllChannels)
    end

    # figure out the boundaries based on the positions of the @points
    # doesn't take into account minimum values for now
    def points_bounds
      dot_width = @dot_image_file.rows
      return max_x + dot_width, max_y + dot_width
    end

    def max_x
      @points.max {|a,b| a.x <=> b.x }.x
    end
    
    def min_x
      @points.min {|a,b| a.x <=> b.x }.x
    end

    def max_y
      @points.max {|a,b| a.y <=> b.y }.y
    end
    
    def min_y
      @points.min {|a,b| a.y <=> b.y }.y
    end
    
  end
  
end