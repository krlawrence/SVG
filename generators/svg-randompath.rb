require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()

c.setFill("blue")
c.setStroke("none")

x = 50
y = 200
data = "M#{x},#{y}"

1.upto 30 do |i| 
  x = x + rand(50)
  if i % 2 == 0
    y1 = y
  else
    y1 = y - rand(160)
  end
  data += " L#{x},#{y1}" 
end

data += " z"

c.drawPath(data)

c.emitFooter()
