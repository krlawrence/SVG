require "./SVGTools.rb"

c = SVGTools.new

colors = %w(red blue green yellow cyan magenta pink darkgreen)

c.emitHeader()

x = orgx = 50
w = 30
space = 20
base  = 500

c.setStroke("none")

# Draw some bars of random height with a minimum height of 50
for i in (0...colors.length)
  h = [rand(400),50].max
  y = base-h
  c.setFill(colors[i])
  c.drawRect(x,y,w,h)
  x = x + w + space
end

# Draw the axis lines
c.setStroke("black")
c.drawLine(orgx,base,(colors.length+1)*(space+w),base)
c.drawLine(orgx,50,orgx,base)

c.emitFooter()                                                            
