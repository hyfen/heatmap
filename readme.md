# Ruby Heatmaps

A gem (note: it's not nearly a gem yet) to generate [heatmaps](http://www.google.ca/images?um=1&hl=en&q=heatmap&aq=f&aqi=&aql=&oq=).

## Goal

Turning something like the following into a useful gem: 

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


### Sample output

![Sample Heatmap](http://dl.dropbox.com/u/1144778/screencaps/cap_03042011_190002.png)

## Inspiration

- [gheat](http://code.google.com/p/gheat/) (gradient and dot files in examples/ come from here)
- Ruby implementation of GMercatorProject from [this gist](https://gist.github.com/20688)

## TODOs

- actually abstract out the sample code into a proper Heatmap class
- package it into a gem
- generate tiles useful for Google Map mashups