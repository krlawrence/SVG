require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
#c.setFill("none")
c.setStrokeWidth(1)
c.newGroup(stroke="orange")
c.setStroke("") 
c.setFill("")
c.setStrokeWidth("")

cx  = 350  # Center x
cy  = 350  # Center y
st  = 0.2  # Step between each set of 2 lines

min = 30    # Minimum allowed line length
max = 250   # Maximum above min allowed

path = ""

0.step(360,st) do |a|
  len = min+rand(max)
  point1 = c.getPointOnCircle(cx,cy,len,a)
  path += "M#{cx},#{cy}"   
  path += " L#{point1[0]},#{point1[1]} "
end

path += "z"
c.drawPath(path)        


c.endGroup()
c.emitFooter()






