require "./SVGTools.rb"

c = SVGTools.new

c.emitHeader()


x  = 200
y  = 400
w  = 300
h  = 300
inc = 10
c.newGroup( stroke="#999", fill="none")
c.setFill("")
c.setStroke("")

15.times do |i|
  path = "M#{x},#{y} L#{x+w},#{y} L#{x+w/2},#{y-h} z"
  c.setStrokeWidth(6)
  c.setStroke( i%2 == 0 ? "blue" : "yellow" )
  c.drawPath( path )
  x += inc
  y -= inc/2
  h -= inc*2
  w -= inc*2
  #puts x1,y,w,h
end

c.endGroup()
c.emitFooter()
