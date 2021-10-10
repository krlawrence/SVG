require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("")
c.setStroke("")
c.newGroup( stroke="blue", fill="none" )

#cx  = 350 # Center of main circle,x
#cy  = 350 # Center of main circle,y
cx  = 350 # Center of main circle,x
cy  = 350 # Center of main circle,y

r1 = ARGV[0].to_i  # Radius of main circle                                                   
r2 = ARGV[1].to_i  # Radius for each extended point                                          
s1 = ARGV[2].to_i  # Step count for main circle arcs                                         
s2 = ARGV[3].to_i  # Step count for each point      

 # Look to see if we should stroke or fill the shape other than in our default setting.  
tmp = ARGV[4]     
if tmp.include?("f")
  c.setFill(ARGV[5])
  c.setStroke("none")
end

if tmp.include?("s")
  c.setStroke(ARGV[5])
end
      
# Draw our shape!                                    
path = ""
a = 0
until a >= 360 do
  point = c.getPointOnCircle(cx,cy,r1,a)
  if a==0
    path += "M #{point[0]},#{point[1]}"
    a += s1
  else
    point = c.getPointOnCircle(cx,cy,r1,a)
    path += "A #{r1},#{r1},0,0,1,#{point[0]},#{point[1]}"
    a += s2
    point = c.getPointOnCircle(cx,cy,r2,a)
    path += "L #{point[0]},#{point[1]}"
    a += s2
    point = c.getPointOnCircle(cx,cy,r1,a)
    path += "L #{point[0]},#{point[1]}"
    a += s1
  end
end
path += " z"
c.drawPath(path)  
#c.drawCircle(cx,cy,175)
c.endGroup()
c.emitFooter()






