require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("#99ee00")
c.setStrokeWidth(4)
c.newGroup(stroke="orange")
c.setStroke("") 
c.setFill("")
c.setStrokeWidth("")

cx  = 350  # Center x
cy  = 350  # Center y
r1  = 250  # Line length 1
#r2  = 150  # Line length 2
r2  = 225  # Line length 2
s1  =   5  # Step between a connected pair of lines 
s2  =  10  # Step between each set of 2 lines
ax  =   5  # Arc radius x
ay  =   5  # Arc radius y

i   = 0

7.step(367,s2) do |a|
  len = (i%2==0) ? r1 : r2
  point1 = c.getPointOnCircle(cx,cy,len,a)
  point2 = c.getPointOnCircle(cx,cy,len,a+s1)
  i += 1

  path = "M#{cx},#{cy} L#{point1[0]},#{point1[1]} 
          A#{ax},#{ay},0,1,1,#{point2[0]},#{point2[1]}
          L #{cx},#{cy} Z"

  c.drawPath(path)        
end


c.endGroup()
c.emitFooter()





