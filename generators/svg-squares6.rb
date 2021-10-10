require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
x = 200
y = 200
w = 25
h = 25
d = 4
rows = 12
cols = 12
id = 0
points = []
c.newGroup(stroke="black")
rows.times do |i|
  x1 = x
  cols.times do |j|
    r = rand(255)
    g = rand(255)
    b = rand(255)
    c.setId(id)
    c.setFill("rgb(#{r},#{g},#{b})")
    c.drawRect(x1,y,w,h)
    points += [x1,y]
    x1 += w+d
    id += 1
  end
  x1 = x
  y += h+d
end
c.endGroup()

puts "<script>"
puts "maxId = #{id-1};"
puts "a = ["
j=0
while j < points.size do
  print "#{(points[j])},#{(points[j+1])},"
  j += 2
  if (j%12) == 0
    puts
  end
end
puts "];"

puts"function scramble()"
puts"{"
puts"  for (i=0; i<maxId; i++)"
puts"  {"
puts"    sq = document.getElementById(i);"
puts"    x=rand(900);"
puts"    y=rand(900);"
puts"    sq.setAttribute('x',x);"
puts"    sq.setAttribute('y',y);"
puts"  }"
puts"}"
puts "</script>"

c.emitFooter()


