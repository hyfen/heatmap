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
      default_dot_image = File.join(ASSET_DIR, "dots", "dot.png")
      @dot = Magick::Image.read(default_dot_image)[0]
    end

    def output(filename="output.png")
      @heatmap = Magick::Image.new(@width, @height)
      @heatmap = generate_map(@heatmap)
      @heatmap = colorize(@heatmap)
      @heatmap.write(filename)
    end
    
    protected

    def generate_map(heatmap)
      @points.each do |point|
        heatmap.composite!(@dot, Magick::NorthWestGravity, point.x, point.y, Magick::OverCompositeOp)      
      end
      return heatmap
    end
    
    def colorize(heatmap)
      default_clut_image = File.join(ASSET_DIR, "gradients", "fire.png")
      clut = Magick::Image.read(default_clut_image)[0]
      heatmap.clut_channel(clut, Magick::AllChannels)
      return heatmap
    end
    
  end

end