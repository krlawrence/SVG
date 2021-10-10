require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("A rectangular grid")

c.emitHeader(1000,1000)

c.setStroke("blue")
c.setStrokeWidth("0.5")
c.setStrokeOpacity("0.7")
c.setFill("")

c.drawGridRect(50,100,10,30,20)
c.drawGridRect(50,350,10,5,30)
c.drawGridRect(250,350,30,40,10)

c.emitFooter()                                                            

