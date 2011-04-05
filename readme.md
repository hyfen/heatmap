# Ruby Heatmaps

A gem to generate [heatmaps](http://www.google.ca/images?um=1&hl=en&q=heatmap&aq=f&aqi=&aql=&oq=).

## Usage

	require 'heatmap'
	
	heatmap = Heatmap::Map.new
	
	heatmap.points << Heatmap::Point.new(0, 0, 0.1)
	heatmap.points << Heatmap::Point.new(80, 5, 0.3)
	heatmap.points << Heatmap::Point.new(10, 5, 0.2)
	heatmap.points << Heatmap::Point.new(23, 5, 0.8)
	heatmap.points << Heatmap::Point.new(50, 50, 0.9)
	heatmap.points << Heatmap::Point.new(20, 10, 0.9)
	heatmap.points << Heatmap::Point.new(100, 85, 1.0)
	heatmap.points << Heatmap::Point.new(100, 60, 1.0)
	heatmap.points << Heatmap::Point.new(90, 90, 1.0)
	heatmap.points << Heatmap::Point.new(90, 30, 0.8)
	heatmap.points << Heatmap::Point.new(90, 45, 0.9)

	heatmap.output("output.png")


### Sample output

![Sample Heatmap](http://dl.dropbox.com/u/1144778/heatmap/output2.png)

## Giving it a whirl

	$ git clone git@github.com:hyfen/heatmap.git
	$ cd heatmap
	$ rake build
	$ gem install pkg/heatmap-0.0.2.gem
	
In IRB:

	require 'heatmap'
	heatmap = Heatmap::Map.new

## Inspiration

- [gheat](http://code.google.com/p/gheat/) (gradient and dot files in examples/ come from here)
- Ruby implementation of GMercatorProject comes from [this gist](https://gist.github.com/20688)

## TODOs

- customizability
- generate tiles useful for Google Map mashups