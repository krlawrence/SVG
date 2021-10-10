require "./SVGTools.rb"

c = SVGTools.new 
c.setTitle("Tests")
puts c.getVersion()
puts c.getVersionDate()
c.emitHeader()
c.setOpacity("0.5")
c.newGroup( stroke="black", fill="none")
c.setOpacity("")

c.setFill("blue")
c.setStroke("red")
c.setStrokeWidth("20")
c.drawCircle(300,300,100)

c.endGroup()
c.emitFooter()

