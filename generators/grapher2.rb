require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
#c.setFill("black")
c.setFill("bisque")
c.drawRect(0,0,1000,1000)
c.setFill("red")
c.setStroke("none")
c.setStrokeWidth(1)
c.newGroup()       
c.setFill("")
c.setStrokeWidth("")
c.setStroke("")

x = 0
y = 0
#num = 15000
num = 1000
points=[]
num.times do
  x = rand(1000)
  #x = [[rand(1000),50].max,950].min
  y = rand(1000)
  #y = [[rand(1000),50].max,950].min
  points += [x,y]
end

#r=2
r=5
0.step(points.length-2,2) do |i|
  cx = points[i]
  cy = points[i+1]
  if i == num
    c.endGroup()
    c.setFill("blue")
    c.newGroup()
    c.setFill("")
  end 
  c.drawCircle(cx,cy,r)
end

c.endGroup()
c.emitFooter()


