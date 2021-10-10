require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()
c.setStroke("black")
c.setFill("red")
c.drawGrid(10,10,20,20)
c.setFillOpacity("0.5")
c.newGroup()
c.drawCircle(150,150,75)
c.setFill("#00ff00")
c.drawCircle(250,150,75)
c.setFill("blue")
c.drawCircle(200,200,75)
c.endGroup()
c.emitFooter()
