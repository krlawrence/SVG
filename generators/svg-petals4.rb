require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("#99ee00")
c.setStrokeWidth(4)
c.newGroup(stroke="orange")
c.setStroke("") 
c.setFill("")
c.setStrokeWidth("")

cx  = 350 # Center x
cy  = 350 # Center y
r1  = 250 # Line length
#s1  = 20  # Step between a connected pair of lines 
s1   = 5  # Step between a connected pair of lines 
#s2  = 30  # Step between each set of 2 lines
s2   = 10  # Step between each set of 2 lines
#ax  = 25  # Arc radius x
ax   =  5  # Arc radius x
#ay  = 25  # Arc radius y
ay   =  5  # Arc radius y

0.step(360,s2) do |a|
  point1 = c.getPointOnCircle(cx,cy,r1,a)
  point2 = c.getPointOnCircle(cx,cy,r1,a+s1)

  path = "M#{cx},#{cy} L#{point1[0]},#{point1[1]} 
          A#{ax},#{ay},0,1,1,#{point2[0]},#{point2[1]}
          L #{cx},#{cy} Z"

  c.drawPath(path)        
end


c.endGroup()
c.emitFooter()





