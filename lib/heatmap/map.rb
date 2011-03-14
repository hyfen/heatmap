module Heatmap

  require 'rmagick'

  class Map
    ASSET_DIR = File.expand_path(File.join(File.dirname(__FILE__), '../..', 'examples'))
    DEFAULT_DOT_IMAGE = File.join(ASSET_DIR, "dots", "dot.png")
    DEFAULT_CLUT_IMAGE = File.join(ASSET_DIR, "gradients", "fire.png")
    DEFAULT_OUTPUT_FILE = "output.png"
    DEFAULT_WIDTH = 300
    DEFAULT_HEIGHT = 200
    
    attr_reader :width, :height
    attr_accessor :points

    def initialize(width=DEFAULT_WIDTH, height=DEFAULT_HEIGHT)
      @width = width
      @height = height
      @points = []
    end

    def dot_image=(dot_image)
      @dot_image_file = Magick::Image.read(dot_image)[0] if File.exists?(dot_image)
    end
    
    def clut_image=(clut_image)
      @clut_image_file = Magick::Image.read(clut_image)[0] if File.exists?(clut_image)
    end      

    def output(filename=DEFAULT_OUTPUT_FILE)
      @heatmap = Magick::Image.new(@width, @height)
      generate_map
      colorize
      @heatmap.write(filename)
    end
    
    protected

    def generate_map
      @dot_image_file || self.dot_image=DEFAULT_DOT_IMAGE      
      @points.each do |point|
        @heatmap.composite!(@dot_image_file, Magick::NorthWestGravity, point.x, point.y, Magick::OverCompositeOp)      
      end
    end
    
    def colorize
      @clut_image_file || self.clut_image=(DEFAULT_CLUT_IMAGE)
      @heatmap.clut_channel(@clut_image_file, Magick::AllChannels)
    end 
    
  end
  
end