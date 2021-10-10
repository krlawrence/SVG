# Take a set of percentage values and construct a pie chart with
# appropriately sized slices.
#
# This version uses the SVGTools helper function to build a pie.

require "./SVGTools.rb"  
c = SVGTools.new 

c.emitHeader()

c.setStroke("black")

r  = 150
cx = 200
cy = 200

#values = [10,3,2,3,2,20,10,30,5,15]    # Values as percentages. Total should equal 100.
values = [45,15,30,10]                  # Values as percentages. Total should equal 100.

c.drawPie(cx,cy,r,values)

c.emitFooter()             


