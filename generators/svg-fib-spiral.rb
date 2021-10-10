require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader(1000,1000,"")
c.setFill("")
c.setStroke("blue")
c.setStrokeWidth(1)

cx = 500
cy = 600
a  = 0
b  = 1
s  = 24

0.step(360-s,s) do |i|
  len = a+b
  a = b
  b = len
  #puts len , " ; " , i
  point = c.getPointOnCircle(cx,cy,len+30,i)  
  c.drawLine(cx,cy,point[0],point[1])
end

c.emitFooter()


