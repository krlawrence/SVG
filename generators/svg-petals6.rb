require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("brown")
c.setStrokeWidth(4)
c.newGroup(stroke="brown")
c.setStroke("") 
c.setFill("")
c.setStrokeWidth("")

cx  = 350  # Center x
cy  = 350  # Center y
s1  =   5  # Step between a connected pair of lines 
s2  =  10  # Step between each set of 2 lines
ax  =   5  # Arc radius x
ay  =   5  # Arc radius y

min = 100  # Minimum allowed line length
max = 275  # Maximum allowed line length

i   = 0

0.step(360,s2) do |a|
  len = [rand(max),min].max
  point1 = c.getPointOnCircle(cx,cy,len,a)
  point2 = c.getPointOnCircle(cx,cy,len,a+s1)

  path = "M#{cx},#{cy} L#{point1[0]},#{point1[1]} 
          A#{ax},#{ay},0,1,1,#{point2[0]},#{point2[1]}
          L #{cx},#{cy} Z"

  c.drawPath(path)        
end


c.endGroup()
c.emitFooter()





