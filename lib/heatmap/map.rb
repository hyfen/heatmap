module Heatmap

  require 'rmagick'

  ASSET_DIR = File.expand_path(File.join(File.dirname(__FILE__), '../..', 'examples'))

  class Map
    attr_reader :width, :height
    attr_accessor :points

    def initialize(width, height)
      @width = width
      @height = height
      @points = []
      @output = Magick::Image.new(@width, @height)
    
      default_dot_image = File.join(ASSET_DIR, "dots", "dot.png")
      @dot = Magick::Image.read(default_dot_image)[0]
    end

    def generate(filename="output.png")
      generate_map!
      colorize!
      @output.write(filename)
    end
    
    protected

    def generate_map!
      @points.each do |point|
        @output.composite!(@dot, Magick::NorthWestGravity, point.x, point.y, Magick::OverCompositeOp)      
      end
    end
    
    def colorize!
      default_clut_image = File.join(ASSET_DIR, "gradients", "classic.png")
      clut = Magick::Image.read(default_clut_image)[0]
    	@output.clut_channel(clut)
    end
    
  end

end