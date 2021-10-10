require "./SVGTools.rb"

c = SVGTools.new 

points = [10,10,50,10,50,50]

c.drawPolyLine(points)

c.drawPolyLine(points, "evenodd"  )
