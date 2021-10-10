require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Plots the graph of y = 2^x")

c.setMetaData("script-version",1)
c.emitHeader(900,900)
c.setFill("blue")
c.drawText(50,80,"y = 2^x")
c.setFill("")
xf = "matrix(1,0,0,-1,50,720)"
c.setTransform(xf)
c.newGroup()
c.setTransform("")
points = []
points2 = []
ybase = 300
xbase = 200

0.step(9.25,0.05)  do |x|
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
c.drawGridRect(50,100,62,35,10,10)

c.setStrokeOpacity("")
c.setFill("blue")
c.setStroke("")
c.drawText(50,740,"0")
c.drawText(130,740,"4")
c.drawText(210,740,"8")
c.drawText(230,740,"9")
c.drawText(290,740,"12")
c.drawText(370,740,"16")
c.drawText(20,208,"512")
c.drawText(20,464,"256")
c.drawText(20,592,"128")
c.drawText(30,720,"0")

c.emitFooter()                                                            


