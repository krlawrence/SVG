require "./SVGTools.rb"

def recursiveDraw( ctx, x, y, len)
  if ( len < MIN )
    return
  end       

  len = len / 2 

  recursiveDraw( ctx, x+len , y     , len ) 
  recursiveDraw( ctx, x-len , y     , len ) 
  recursiveDraw( ctx, x     , y-len , len ) 
  recursiveDraw( ctx, x     , y+len , len ) 

  points = []
  points += [x,y-len] 
  points += [x+len,y] 
  points += [x,y+len] 
  points += [x-len,y] 
  points += [x-len,y] 
  points += [x,y-len] 
  points += [x+len,y] 
  #puts points
  ctx.drawPolyLine(points)       
end

c = SVGTools.new 

c.emitHeader()
if ARGV[0] !=""
  MIN = ARGV[0].to_i
else
  MIN = 16
end

c.setStroke("blue")
c.setStrokeWidth(2)
c.setFill("none")
c.newGroup()
c.setStroke("")
c.setStrokeWidth("")
c.setFill("")

recursiveDraw(c,400,400,400)

c.endGroup()
c.emitFooter()

