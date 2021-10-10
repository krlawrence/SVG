require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
x = 10
y = 10
w = 25
h = 25
d = 4
#r = 255
id = 0
c.newGroup(stroke="black")
16.times do |i|
  x1 = x
  16.times do |j|
  r = rand(255)
  g = rand(255)
  b = rand(255)
    c.setId(id)
    c.setFill("rgb(#{r},#{g},#{b})")
    c.drawRect(x1,y,w,h)
    x1 += w+d
    id += 1
  end
  x1 = x
  y += h+d
end
c.endGroup()
c.emitFooter()

