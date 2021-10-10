require "./SVGTools.rb"


$points=[]
r=5

def unique(x,y,r)
  f = true
  if $points.length >= 2
    0.step($points.length-2,2) do |i|
      t = r+1
      x1 = $points[i]
      y1 = $points[i+1]
  
      #puts "x=#{x},y=#{y},t=#{t},x1=#{x1},y1=#{y1}"
      if (( x < x1-t  || x > x1+t ) && ( y < y1-t || y > y1+t)) 
        next
      else
        f = false
        break
      end
    end
  end
  #puts "returning",f 
  return f
end

c = SVGTools.new 

c.emitHeader()
c.setFill("none")
c.setStroke("blue")
c.setStrokeWidth(1)
c.newGroup()       
c.setFill("")
c.setStrokeWidth("")
c.setStroke("")


x = 0
y = 0
100.times do
  begin
    x = [[rand(1000),50].max,950].min
    y = [[rand(1000),50].max,950].min
  end until unique(x,y,r)
  $points += [x,y]
end

0.step($points.length-2,2) do |i|
  cx = $points[i]
  cy = $points[i+1]
  c.drawCircle(cx,cy,r)
end

c.endGroup()
c.emitFooter()

