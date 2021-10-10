require "./SVGTools.rb"

c = SVGTools.new 

c.emitHeader()
c.setStroke("")

#col = %w(red white blue)
#col = %w(red yellow blue)
col = %w(red blue)
#w = 10
#h = 5
w = 20
h = 10

x = 10
y = 100

i = 0
id = 1
90.times do
  c.setFill(col[i])
  c.setId("#{id}")
  c.drawRect(x,y,w,h)
  x += w
  i += 1
  if i >= col.length
    i = 0
  end
  id += 1
end

c.emitFooter()







