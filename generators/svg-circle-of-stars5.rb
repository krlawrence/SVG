require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
c.setStroke("")
c.newGroup( stroke="blue")

cx  = 350 # Center of main circle,x
cy  = 350 # Center of main circle,y
r1  = 250 # Radius of main circle
r2  = 10  # Radius for each star
#s1  = 20  # Step count for main circle
s1  = 10  # Step count for main circle
s2  = 20  # Step count for each star
                                                               
#1.upto 4 do
1.upto 6 do
  0.step(360,s1) do |a|
    point = c.getPointOnCircle(cx,cy,r1,a)
    c.setStroke("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    c.drawStar(point[0],point[1],r2,s2)
  end
  #r1 -= 50 
  r1 -= 30 
  #r2 += 3 
end

# Draw one final larger star right in the middle of the shape
c.drawStar(cx,cy,50,10)

c.endGroup()
c.emitFooter()



