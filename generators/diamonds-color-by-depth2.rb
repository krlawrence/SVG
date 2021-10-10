require "./SVGTools.rb"

@depth = 0
@colors = %w(#000 darkblue blue cornflowerblue deepskyblue darkturquoise lightskyblue darkcyan  )

def recursiveDraw( ctx, x, y, len)
  if ( len < MIN )
    return
  end       

  @depth += 1
  #puts @depth
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
  
  ctx.setStroke(@colors[@depth])
  ctx.drawPolyLine(points) 
  @depth -= 1      
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



