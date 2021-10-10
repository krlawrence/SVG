require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

c.setFill("")
c.newGroup( stroke="none", fill="red")
c.drawRect(50,50,200,100,30,30)
c.drawRect(50,200,200,100,100,100)
c.drawRect(300,50,200,100,30,10)
c.drawRect(300,200,200,100,10,30)
c.endGroup()

c.emitFooter()   
