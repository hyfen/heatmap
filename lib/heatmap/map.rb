module Heatmap

  require 'rmagick'

  class Map
    attr_reader :width, :height
    attr_accessor :points

    def initialize(width, height)
      @width = width
      @height = height
      @points = []
      @output = Magick::Image.new(@width, @height)
    
      @dot = Magick::Image.read("./examples/dots/dot.png")[0]
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
      clut = Magick::Image.read("./examples/gradients/classic.png")[0]
    	@output.clut_channel(clut)
    end
    
  end

end