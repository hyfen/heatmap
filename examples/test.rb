require 'rubygems'
require 'rmagick'

output = Magick::Image.new(500, 500)
dot = Magick::Image.read("dots/dot.png")[0]
clut = Magick::Image.read("gradients/classic.png")[0]

output.composite!(dot, Magick::CenterGravity, 90, 135, Magick::OverCompositeOp)
output.composite!(dot, Magick::CenterGravity, 20, 155, Magick::OverCompositeOp)
output.composite!(dot, Magick::CenterGravity, -14, 115, Magick::OverCompositeOp)
output.composite!(dot, Magick::CenterGravity, 40, 135, Magick::OverCompositeOp)

# apply the gradient map
output.clut_channel(clut)

output.write("heatmap.png")