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
      self.generate_map
      @output.write(filename)
    end

    protected

    def generate_map
      @points.each do |point|
        @output.composite!(@dot, Magick::CenterGravity, point.x, point.y, Magick::OverCompositeOp)      
      end
    end

  end

end