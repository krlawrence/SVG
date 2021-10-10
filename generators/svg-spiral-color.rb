require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader(1000,1000,"0,0,5000,5000")

cx = 2500   # Midpoint X
cy = 2100   # Midpoint Y
len = 1     # Length of line
inc = 0.1   # Increment
sweep = 0.5 # Sweep angle
tx = cx
ty = cy
cnt = 0
strkw = 70   # Line stroke width

c.setFill("none")
c.setStrokeWidth(strkw)
c.setStroke("blue")
c.setFillOpacity("")  
c.newGroup()
c.setFill("")
c.setStroke("")
c.setStrokeWidth("")   
c.setFill("#222")
c.drawRect(0,0,5000,5000)
c.setFill("")

c.newGroup()
c.newGroup()

0.step(9470,sweep) do |a|
  len += inc
  point = c.getPointOnCircle(cx,cy,len,a)
  if a % 360 == 0
   # strkw += 3
   # c.setStrokeWidth(strkw)  
  end

  cnt += 1
  if cnt == 100
    c.endGroup()
    c.setStroke("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")  
    c.newGroup() 
    c.setStroke("")
    cnt = 0
  end

  c.drawLine(tx,ty,point[0],point[1])
  tx = point[0]
  ty = point[1]
end
c.endGroup()
c.endGroup()
c.endGroup()
c.emitFooter()





