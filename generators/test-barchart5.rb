require "./SVGTools.rb"

c = SVGTools.new

x = 50
y = 250
width = 25
spacing = 2

c.emitHeader() 

# Test the SVG Library for case where the user provides a color array
# and there are more values than colors. The expected result is that the
# library will wrap around back to the start of the color array. We also 
# test that the stroke width is correctly inherited by the bar chart method.
colors = ["orangered","plum","goldenrod","yellowgreen"]
values = [20,35,79,54,100,57,18,36,99,120]
  
c.setStrokeWidth(2)
c.drawBarChart(x,y,values,width,spacing,true,colors)
         
c.emitFooter()                                                            




