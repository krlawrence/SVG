require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setStroke("")
c.setFill("")
c.newGroup( stroke="none", fill="#008")
x = oldx = 50
y = 50
w = 200
h = 120
rx = 5 
ry = 5
spacer = 25

5.times do
  4.times do
    c.drawRect(x,y,w,h,rx,ry)
    x += (spacer+w)
    rx += 5
    ry += 5  
  end
  y += (spacer+h)
  x = oldx
end

c.endGroup()
c.emitFooter()   
