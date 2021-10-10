require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

x1 = 50
x2 = 400
y1 = 50

c.setFill("")
c.setStroke("")
#c.setStrokeWidh("")
c.newGroup(stroke="blue")
0.step(45,1) do |a|
  y2 = y1+ (Math.tan(a*Math::PI/180) * x2)
  c.drawLine(x1,y1,x2,y2)
end
c.endGroup()
puts "<text x='50' y='500' fill='blue' font-size='24'>x1=50, x2=400, y1=50, y2=y1+x2*tan(a) [a:0..45]</text>"
c.emitFooter()
