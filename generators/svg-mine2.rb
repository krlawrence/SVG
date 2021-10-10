require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("")
c.setStroke("")
c.newGroup( stroke="none", fill="orange" )

cx  = 350 # Center of main circle,x
cy  = 350 # Center of main circle,y
r1  = 100 # Radius of main circle
r2  = 200 # Radius for each extended point
r3  = 250
s1  = 10  # Step count for main circle arcs
s2  = 10  # Step count for each point
                                           
path = ""
a = 0
ct = 1
until a >= 360 do
  point = c.getPointOnCircle(cx,cy,r1,a)
  if a==0
    path += "M #{point[0]},#{point[1]}"
    a += s1
  else
    point = c.getPointOnCircle(cx,cy,r1,a)
    path += "A #{r1},#{r1},0,0,1,#{point[0]},#{point[1]}"
    a += s2
    if ct % 2 == 0
      rt = r3
    else
      rt = r2
    end
    point = c.getPointOnCircle(cx,cy,rt,a)
    path += "L #{point[0]},#{point[1]}"
    a += s2
    point = c.getPointOnCircle(cx,cy,r1,a)
    path += "L #{point[0]},#{point[1]}"
    a += s1
  end
  ct += 1
end
 path += " z"
 c.drawPath(path)  

c.endGroup()
c.emitFooter()





