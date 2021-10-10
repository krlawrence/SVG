require "./SVGTools.rb"

c = SVGTools.new

c.setTitle("Basic tests")

c.emitHeader(500,500)
c.setFill("none")
c.setStroke("blue")
c.setTransform("translate(100,100)")
c.drawPath("M0,0 h100 v100 h-100 z")
#c.newGroup()
#c.endGroup()
c.emitFooter()  

values = [10,15,20,25]
values.each do |v|
  puts v
end                                                          
