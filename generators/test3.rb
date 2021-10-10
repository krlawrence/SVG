require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()  

c.drawRect( 10,10,100,50 )
c.drawCircle(50,50,35)

c.setStroke("blue")
c.drawRect( 10,10,100,50 )
c.drawCircle(50,50,35)

c.setFill("none")
c.drawRect( 10,10,100,50 ) 
c.drawCircle(50,50,35)

c.setFill("none")
c.setStroke("none")
c.drawRect( 10,10,100,50 ) 
c.drawCircle(50,50,35)

c.emitFooter()
