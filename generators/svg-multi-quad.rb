require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
#c.setStrokeWidth(2)
c.newGroup(stroke="blue", fill="none")  
xfixed = 245
y = 260

ydelta = 140
#ydelta = 80 

25.upto xfixed+220 do |x|
  d = "M#{xfixed},#{y+ydelta} Q#{x},#{y} #{xfixed},#{y-ydelta}"
  #c.setStroke("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  c.setStroke( x%10 == 0 ? "black" : "gold" )
  #c.setStroke("rgb(70,0,#{x})")
  c.drawPath(d)
end
c.endGroup()
c.emitFooter()



