require "./SVGTools.rb"

c = SVGTools.new 

cx = 400
cy = 400
r  = 50
d  = 50
maxr = 300

c.setTitle("Polar coordinate system")
c.emitHeader()
#c.setTransform("matrix(1 0 0 -1 0 700)")
c.newGroup(stroke="#aaaaaa", fill="none")
c.drawLine(cx-maxr,cy,cx+maxr,cy)
c.drawLine(cx,cy-maxr,cx,cy+maxr)
c.endGroup()

# Draw some distance circles
c.newGroup(stroke="blue", fill="none")
while r < maxr do
  c.drawCircle(cx,cy,r)
  p = c.getPointOnCircle(cx,cy,r,300)
  c.drawText(p[0]+10,p[1],"#{r}")
  r += d
end
c.endGroup()

# Draw angle lines and labels
c.newGroup(stroke="red", fill="red")
0.step(330,30) do |a|
  p = c.getPointOnCircle(cx,cy,maxr,a)
  c.drawLine(cx,cy,p[0],p[1])
  # Adjust the label to account for the SVG coordinate system being y-down
  b = a
  if a != 180
    b = 360 - a
  end  

  if a == 0
    txt = "0/360"
    b = 0
  else
    txt = "#{b}"
  end

  x = p[0]
  y = p[1]
  # Position the labels nicely
  if p[1] >cy
    y = p[1] + 20
  elsif p[1] <= p[1]
    y = p[1] - 10
  end

  if p[0] <= cx
    x = p[0] -10
  end

  c.drawText(x,y,txt)
end
c.endGroup()

#c.endGroup()
c.emitFooter()




