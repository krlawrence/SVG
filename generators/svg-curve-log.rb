require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Plots the graph of y = log10(x)")

c.emitHeader(900,450)
c.setFill("blue")
c.drawText(0,80,"y = log10(x)")
c.setFill("")
xf = "matrix(1,0,0,-1,0,400)"
c.setTransform(xf)
c.newGroup()
c.setTransform("")
points = []
points2 = []
ybase = 300
xbase = 200

1.upto 800  do |x|
  y = Math.log10(x)*100
  points += [x,y]
end

c.setStroke("blue")
c.setFill("none")
c.drawPolyLine(points)
c.endGroup()
c.setFill("")

c.setStrokeOpacity(0.5)
c.setStroke("#aaaaaa")
c.drawGridRect(0,100,12,32,25)

c.setStrokeOpacity("")
c.setFill("blue")
c.setStroke("")
c.drawText(0,430,"1")
c.drawText(780,430,"800")
c.drawText(820,100,"3")
c.drawText(820,400,"0")

c.emitFooter()                                                            
