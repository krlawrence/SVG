require "./SVGTools.rb"

c = SVGTools.new


c.emitHeader()


c.setStroke("blue")
c.setStrokeWidth(0.25)
c.setFill("none")

c.drawGrid(50,50,50,10)

c.emitFooter()                                                            
