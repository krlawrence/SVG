require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Plots the graph of y = 2^x")

c.setMetaData("script-version",1)
c.emitHeader(900,900)
c.setFill("blue")
c.drawText(50,80,"y = 2^x")
c.setFill("")
xf = "matrix(1,0,0,-1,50,420)"
c.setTransform(xf)
c.newGroup()
c.setTransform("")
points = []
points2 = []
ybase = 300
xbase = 200

0.step(8.30,0.05)  do |x|
  #y = Math::E**x
  y = 2**x
  points += [x*20,y]
end

c.setStroke("blue")
c.setFill("none")
c.drawPolyLine(points)
c.endGroup()
c.setFill("")

c.setStrokeOpacity(0.3)
c.setStroke("#aaaaaa")
c.drawGridRect(50,100,32,35,10,10)

c.setStrokeOpacity("")
c.setFill("blue")
c.setStroke("")
c.drawText(50,440,"0")
c.drawText(130,440,"4")
c.drawText(210,440,"8")
c.drawText(370,440,"16")
c.drawText(20,180,"256")
c.drawText(20,300,"128")
c.drawText(30,420,"0")

c.emitFooter()                                                            


