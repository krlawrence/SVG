require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
c.setStrokeWidth(1)

cx  = 350  # Center x
cy  = 350  # Center y
st  = 0.2  # Step between each set of 2 lines

min = 30    # Minimum allowed line length
max = 250   # Maximum above min allowed

path = ""

i = 0
0.step(360,st) do |a|
  len = min+rand(max)
  point1 = c.getPointOnCircle(cx,cy,len,a)
  #c.setStroke("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
  c.setStroke((i%2==0)? "yellow" : "blue")
  c.drawLine(cx,cy,point1[0],point1[1])
  i += 1
end

c.endGroup()
c.emitFooter()







