# Ruby Heatmaps

A gem to generate [heatmaps](http://www.google.ca/images?um=1&hl=en&q=heatmap&aq=f&aqi=&aql=&oq=).

## Usage

	require 'rubygems'
	require 'heatmap'
	
	heatmap = Heatmap::Map.new(300,200)
	
	heatmap.points << Heatmap::Point.new(0, 5, 1)
	heatmap.points << Heatmap::Point.new(80, 5, 1)
	heatmap.points << Heatmap::Point.new(10, 5, 1)
	heatmap.points << Heatmap::Point.new(23, 5, 1)
	heatmap.points << Heatmap::Point.new(50, 50, 1)
	heatmap.points << Heatmap::Point.new(20, 10, 1)
	heatmap.points << Heatmap::Point.new(100, 85, 1)
	heatmap.points << Heatmap::Point.new(100, 60, 1)
	heatmap.points << Heatmap::Point.new(90, 90, 1)

	heatmap.output("output.png")


### Sample output

![Sample Heatmap](http://dl.dropbox.com/u/1144778/heatmap/output.png)

## Inspiration

- [gheat](http://code.google.com/p/gheat/) (gradient and dot files in examples/ come from here)
- Ruby implementation of GMercatorProject from [this gist](https://gist.github.com/20688)

## TODOs

- customizability
- implement support for point intensities (light vs dark spots) 
- generate tiles useful for Google Map mashups