# SVGTools.rb
#
# A simple Ruby class that provides helper methods to aid in the scripted
# generation of SVG content. There are literally hundreds of ways a library
# like this could be added to. This is intended solely for use in specific
# simple ways and not as an example of a full, robust, SVG wrapper library.
# (If I had more time I would love to code up one of those!)
#
# This class exports the following methods:
#
#   createRegPolygon        getPointOnCircleFloat       
#   createTriangleEq        getStroke                                                 
#   drawBarChart            getStrokeOpacity            
#   drawCircle              getStrokeWidth              
#   drawEllipse             getTitle                     
#   drawGrid                getTransform                
#   drawGridRect            getVersion                  
#   drawLine                getVersionDate              
#   drawPath                lineLength                  
#   drawPie                 lineMidpointArray           
#   drawPolygon             lineMidpointArrayFloat      
#   drawPolyline            lineMidpoint                
#   drawRect                lineMidpointFloat           
#   drawRegPolygon          lineSlope                   
#   drawStar                lineVectorPoint             
#   drawTriangleEq          newGroup                    
#   drawText                setDashArray                
#   emitFooter              setFill                     
#   emitHeader              setFillOpacity              
#   endGroup                setId        
#   getDashArray            setMetaData
#   getFill                 setOpacity                  
#   getFillOpacity          setStroke                   
#   getId                   setStrokeOpacity            
#   getLineCap              setStrokeWidth                                 
#   getOpacity              setTitle                    
#   getPointOnCircle        setTransform                
#                           vectorMagnitude             
#                           
#
# Author: Kelvin R. Lawrence     20th-May-2012
#
# History:
#   20-May-2012  -KRL-  Created it.                            V0.1
#    8-Aug-2014  -KRL-  Added drawGridRect method.             V0.51
#   22-Aug-2014  -KRL-  Added drawRegPolygon, set/getLineCap & V0.52
#                       createRegPolygon.
#   27-Aug-2014  -KRL-  Added lineMidpoint                     v0.53                    
#    1-Sep-2014  -KRL-  Added lineVectorPoint                  v0.54
#   29-Sep-2014  -KRL-  Added getPointOnCircleFloat            v0.55
#    8-Oct-2014  -KRL-  Added several methods:                 v0.56
#                        createTriangleEq,drawTriangleEq,
#                        lineMidpointFloat,lineMidpointArray,
#                        lineMidpointArrayFloat
#    3-Dec-2014  -KRL-  Added get/setOpacity and               v0.57 
#                       getVersion,getVersionDate
#    3-Jan-2015  -KRL-  Added vectorMagnitude                  v0.58
#   17-Feb-2015  -KRL-  Added setMetaData                      v0.59
#   23-Feb-2016  -KRL-  Added gapsy parameter to drawGridRect  v0.60
#
# TODO NEXT
#  1. Group stack (push/pop of group values)
#  2. Optimize to only specify an attribute if not already specified on the enclosing group (needs 1. above)
#  3. Inside drawStar, use a group to avoid color being respecified for each line.
#     Need to push/pop attributes before group is created and after it ends.

class SVGTools


def initialize
  @version       = 0.60
  @versionDate   = "2016-Feb-23"
  @fill          = ""
  @stroke        = ""
  @fillopacity   = ""
  @strokewidth   = ""
  @strokeopacity = ""
  @opacity       = ""
  @gfill         = ""
  @gstroke       = ""
  @linecap       = ""
  @gfillopacity  = ""
  @title         = ""
  @transform     = ""
  @dasharray     = ""
  @id            = ""
  @groupnesting  = 0  
  @metadata      = []

end

## -----------------------------------------------------------------------
def drawCircle(cx,cy,r)                  
  print "<circle cx='#{cx}' cy='#{cy}' r='#{r}'"

  s = genAttrString()
  print s
  puts " />"
end

## -----------------------------------------------------------------------
def drawEllipse(cx,cy,rx,ry)
  print "<ellipse cx='#{cx}' cy='#{cy}' rx='#{rx}' ry='#{ry}'"

  s = genAttrString()
  print s
  puts " />"  
end

## -----------------------------------------------------------------------
def drawRect(x,y,w,h,rx="",ry="")
  print "<rect x='#{x}' y='#{y}' width='#{w}' height='#{h}'"

  s = genAttrString()
  print s

  if rx !=""
    print " rx='#{rx}'"
  end

  if ry !=""
    print " ry='#{ry}'"
  end

  puts "/>"
end

## -----------------------------------------------------------------------
def getVersion()
  return @version
end

## -----------------------------------------------------------------------
def getVersionDate()
  return @versionDate
end

## -----------------------------------------------------------------------
def setMetaData(k,v)
  @metadata += [[k,v]]
end

## -----------------------------------------------------------------------
def drawLine(x1,y1,x2,y2)
                  
  s = genAttrString()
  print "<line x1='#{x1}' y1='#{y1}' x2='#{x2}' y2='#{y2}' " + s

  puts "/>"
end

## -----------------------------------------------------------------------
def drawPolyLine(points, fillrule="")
  $, = "," 
  #p = points.to_s
  p = points.join
  n = p.length

  s = genAttrString()
  print "<polyline " + s
  
  if fillrule != ""
    print " fill-rule='#{fillrule}'"
  end

  print " points='#{p}'"
  puts"/>"
end


## -----------------------------------------------------------------------
def drawPolygon(points, fillrule="")
  $, = "," 
  p = points.join
  n = p.length

  s = genAttrString()
  print "<polygon " + s
  
  if fillrule != ""
    print " fill-rule='#{fillrule}'"
  end

  print " points='#{p}'"
  puts"/>"
end


## -----------------------------------------------------------------------
## Using the circle model, creates a polygon of n sides with a given radius
#and center and then renders it.
def drawRegPolygon(cx,cy,nsides,r)
  s = genAttrString()
  
  inc = 360.0/nsides
  points = []

  270.step(630,inc) do |a|
    points  += getPointOnCircle(cx,cy,r,a)
  end       

  drawPolygon(points)              
end

## -----------------------------------------------------------------------
## Using the circle model, creates a polygon of n sides with a given radius
#and center and returns those points to the caller.
def createRegPolygon(cx,cy,nsides,r)
  s = genAttrString()
  
  inc = 360.0/nsides
  points = []

  270.step(630,inc) do |a|
    points  += getPointOnCircle(cx,cy,r,a)
  end       

  return points              
end


## -----------------------------------------------------------------------

def drawPath(data)
  s = genAttrString()
  puts "<path d='#{data}'" + s + " />"
end


## -----------------------------------------------------------------------
def drawText(x,y,text)
  s = genAttrString()
  print"<text x='#{x}' y='#{y}'" + s +  ">"
  print text
  puts "</text>"
end

## -----------------------------------------------------------------------
#  Draws a simple equilateral triangle given the coordinate of one point
#  and the length of a side.
def drawTriangleEq(x,y,side)
  path  = "M#{x},#{y}"
  point = getPointOnCircle(x,y,side,300)
  path += " h#{side}"
  path += " L#{point[0]},#{point[1]}z"
  drawPath(path)
end

# Given the (x,y) of the bottom left vertex and a length, return the vertices
# of an equilateral triangle that uses that length for each side.
def createTriangleEq(x,y,side)
  v = []
  v[0] = x
  v[1] = y
  point = getPointOnCircle(x,y,side,300)
  v[2] = point[0]
  v[3] = point[1]
  v[4] = x+side
  v[5] = y
  return v
end

## -----------------------------------------------------------------------
# LATER: Add support for user defined colors
#        Add support for labels
def drawPie(cx,cy,r,values)
  data = ""
  points = [cx+r,cy]
  a = 0
  onepct = 360.0/100.0        # One percent of 360

  values.each do |v|
    a = a + (onepct * v)  
    points += getPointOnCircle(cx,cy,r,a)
  end

  n = 0
  0.step(points.length-4,2) do
    setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    data =  "M #{cx},#{cy} L #{points[n]},#{points[n+1]} "
    data += "A #{r},#{r},0,0,1,#{points[n+2]},#{points[n+3]} z"
    drawPath(data) 
    n += 2
  end     
end
                                                                          
## -----------------------------------------------------------------------
# LATER: Add tick mark support
#        Add support for labels
#        Use the user defined stroke color for the axes.
def drawBarChart(x,y,values,width=10,spacing=4,axes=true,colors=nil)

  orgx = x
  base = y
  maxh = 0
  clr  = 0
  yext = 20
  # Turn stroke width off in case the user has it on while we draw the bars to save
  # space in the SVG file as we only observe it for the axis line.
  strokeWidth = getStrokeWidth()
  setStrokeWidth("")
  # Draw the bars
  orgFill = getFill()
  values.each do |h|
    y = base-h
    if colors == nil
      setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    else
      setFill( colors[clr] )
      clr += 1
      if clr >= colors.length
        clr = 0
      end
    end
    drawRect(x,y,width,h)
    if h > maxh
      maxh = h
    end
    x = x + width + spacing
  end

  # Restore the stroke width to its prior value and then draw the axis lines
  # if needed.
  setStrokeWidth(strokeWidth)
  if axes
    orgStroke = getStroke()
    setStroke("black")
    drawLine(orgx,base,orgx+(values.length+1)*(spacing+width),base)
    drawLine(orgx,base,orgx,base-maxh-yext)
    setStroke(orgStroke)  
    setFill(orgFill) 
  end
end

## -----------------------------------------------------------------------
def setFill(f)
  @fill = f
end

## -----------------------------------------------------------------------
def getFill()
  return @fill
end

## -----------------------------------------------------------------------
def setStroke(s)
  @stroke = s
end

## -----------------------------------------------------------------------
def getStroke()
  return @stroke
end  

## -----------------------------------------------------------------------
def setStrokeWidth(w)
  @strokewidth = w
end

## -----------------------------------------------------------------------
def getStrokeWidth()
  return @strokewidth
end  

## -----------------------------------------------------------------------
def setFillOpacity(fo)
  @fillopacity = fo
end

## -----------------------------------------------------------------------
def getFillOpacity()
  return @fillopacity
end  

## -----------------------------------------------------------------------
def setStrokeOpacity(so)
  @strokeopacity = so
end

## -----------------------------------------------------------------------
def getStrokeOpacity()
  return @strokeopacity
end  

## -----------------------------------------------------------------------
def setOpacity(o)
  @opacity = o
end

## -----------------------------------------------------------------------
def getOpacity()
  return @opacity
end  


## -----------------------------------------------------------------------
def setTransform(xf)
  @transform = xf
end

## -----------------------------------------------------------------------
def getTransform()
  return @transform
end

## -----------------------------------------------------------------------
def setDashArray(da)
  @dasharray = da
end

## -----------------------------------------------------------------------
def getDashArray()
  return @dasharray
end

## -----------------------------------------------------------------------
def setId(id)
  @id = id
end

## -----------------------------------------------------------------------
def getId(id)
  return @id
end   

## -----------------------------------------------------------------------
def setLineCap(ending)
  @linecap = ending
end   

## -----------------------------------------------------------------------
def getLineCap()
  return @linecap
end   

## -----------------------------------------------------------------------
def newGroup( stroke=@stroke, fill=@fill)
  print "<g"


  if (stroke !='')
    print " stroke='#{stroke}'"
  end   

  if (fill !='')
    print " fill='#{fill}'"
  end 

  s = genAttrStringSpecial()
  
  print s

  puts ">"
  @groupnesting += 1
end

## -----------------------------------------------------------------------
def endGroup()
  puts "</g>"
  @groupnesting -= 1  
end

## -----------------------------------------------------------------------
## Draws a square grid
def drawGrid( x,y,nlines,gapsz)
  x1 = x
  x2 = x1 + (nlines*gapsz)
  y1 = y2 = y

  #puts "<g style='shape-rendering: optimizeSpeed' stroke='black' fill='none' stroke-width='1' stroke-antialiasing='false'>"
  #puts "<g stroke='#{@stroke}' fill='none' stroke-width='#{@strokewidth}' >"

  newGroup()
  #Draw the rows
  0.upto nlines do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x2}' y2='#{y1}' />"
    y1 += gapsz
  end

  x1 = x
  y1 = y
  y2 = y1 + (nlines*gapsz)

  #Draw the columns
  0.upto nlines do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x1}' y2='#{y2}' />"
    x1 += gapsz
  end
  endGroup()
  #puts "</g>"
end 

## -----------------------------------------------------------------------
## Draws a rectangular grid
def drawGridRect( x,y,rows,cols,gapsx,gapsy=gapsx)
  x1 = x
  y1 = y
  x2 = x1 + (cols*gapsx)
  y2 = y1  

  newGroup()
  #Draw the rows
  0.upto rows do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x2}' y2='#{y1}' />"
    y1 += gapsy
  end

  x1 = x
  y1 = y
  x2 = x
  y2 = y1 + (rows*gapsy)

  #Draw the columns
  0.upto cols do
    puts "<line x1='#{x1}' y1='#{y1}' x2='#{x1}' y2='#{y2}' />"
    x1 += gapsx
  end
  endGroup()  
end

## -----------------------------------------------------------------------
# Given a center, radius and angle returns the (x,y) point on the circumference
# for the given radius length at the given angle. The points are returned as
# integers.
#
def getPointOnCircle(cx,cy,r,angle)
  x = cx + (r*Math.cos(Math::PI*angle/180)).round
  y = cy + (r*Math.sin(Math::PI*angle/180)).round  

  return [x,y]
end

## -----------------------------------------------------------------------
# Given a center, radius and angle returns the (x,y) point on the circumference
# for the given radius length at the given angle. The points are returned as
# floating point numbers.
#
def getPointOnCircleFloat(cx,cy,r,angle)
  x = cx + (r*Math.cos(Math::PI*angle/180))
  y = cy + (r*Math.sin(Math::PI*angle/180))  

  return [x,y]
end

## -----------------------------------------------------------------------  
# Use the distance formula (Pythagaros) to calculate the distance between
# two points.
def lineLength(x1,y1,x2,y2)
  #len = Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  return vectorMagtnitude(x1,y1,x2,y2)  
end

## -----------------------------------------------------------------------
def vectorMagnitude(x1,y1,x2,y2)
  vx = x2 - x1
  vy = y2 - y1 
  magnitude = Math.sqrt(vx*vx + vy*vy)  
  return magnitude
end

## -----------------------------------------------------------------------
# Use vector maths to calculate a point a given distance along a
# line defined by its start and end points.
def lineVectorPoint(x1,y1,x2,y2,distance)
  point = []
  vx = x2 - x1
  vy = y2 - y1 
  magnitude = Math.sqrt(vx*vx + vy*vy)  
  vx /= magnitude
  vy /= magnitude  
  point[0] = x1 + vx * distance
  point[1] = y1 + vy * distance 
  return point
end

## -----------------------------------------------------------------------
def lineSlope(x1,y1,x2,y2)
  x1 *= 1.0
  y1 *= 1.0
  y2 *= 1.0
  x2 *= 1.0
  slope = ((y2-y1)/(x2-x1)) 
  return slope
end

## -----------------------------------------------------------------------
def lineMidpoint(x1,y1,x2,y2)
  mid = []
  mid[0] = x1 + (x2-x1)
  mid[1] = y1 + (y2-y1)
  return mid
end


## -----------------------------------------------------------------------
## Gives greater accuracy but will make SVG files that use the results larger.
def lineMidpointFloat(x1,y1,x2,y2)
  mid = []
  mid[0] = x1 + (x2-x1)/2.0
  mid[1] = y1 + (y2-y1)/2.0
  return mid
end

## -----------------------------------------------------------------------
## Returns the midpoint of a line provided in an array of two (x,y) coords.
def lineMidpointArray(line)
  return lineMidpoint(line[0],line[1],line[2],line[3])
end

## -----------------------------------------------------------------------
## Gives greater accuracy but will make SVG files that use the results larger.
def lineMidpointArrayFloat(line)
  return lineMidpointFloat(line[0],line[1],line[2],line[3])
end

## -----------------------------------------------------------------------
## Given a midpoint (cx,cy) a radius (r) and a sweep angle (s) draw a simple star
def drawStar(cx,cy,r,s)
  0.step(360,s) do |a|
    point = getPointOnCircle(cx,cy,r,a)
    drawLine(cx,cy,point[0],point[1])
  end                
end  

## -----------------------------------------------------------------------
## Sets the HTML <title> element text for the SVG we are creating
def setTitle(s)
  @title = s
end

## -----------------------------------------------------------------------
def getTitle()
  return @title
end

## -----------------------------------------------------------------------
def emitHeader(width=1000,height=1000,vbox="")
  puts "<!DOCTYPE html>"
  puts "<html>"
  puts "<head>"
  if @title != ""
    puts "<title>#{@title}</title>"
  end
  puts "<meta name='description' content='Machine generated SVG using a Ruby script.' />"
  puts "<meta name='author' content='Kelvin R. Lawrence' />"
  puts "<meta name='created' content='#{Time.now}' />"
  puts "<meta name='script' content='#{$0}' />"

  if @metadata.size > 0
    @metadata.each do |k,v|
      puts "<meta name='#{k}' content='#{v}' />"
    end
  end

  puts "<meta name='SVGTools version' content='#{@version}' />"
  puts "</head>"
  puts "<body>"
  print"<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='#{width}' height='#{height}'"
  if vbox != ''
    print " viewBox='#{vbox}'"
  end

  if @transform != ""
    print " transform='#{@transform}'"
  end

  puts ">"
end

## -----------------------------------------------------------------------
def emitFooter()
  puts "</svg>"
  puts "</body>"
  puts "</html>"
end

## -----------------------------------------------------------------------
def genAttrString()
  s = ""
  if @fill !="" 
    s +=  " fill='#{@fill}'"
  end   

  if @stroke != "" 
    s += " stroke='#{@stroke}'"
  end  

  if @strokewidth != ""
    s += " stroke-width='#{@strokewidth}'"
  end

  if @transform != ""
    s += " transform='#{@transform}'"
  end

  if @opacity != ""
    s += " opacity='#{@opacity}'"
  end

  if @fillopacity != ""
    s += " fill-opacity='#{@fillopacity}'"
  end

  if @strokeopacity != ""
    s += " stroke-opacity='#{@strokeopacity}'"
  end

  if @dasharray != ""
    s += " stroke-dasharray='#{@dasharray}'"
  end

  if @linecap != ""
    s += " stroke-linecap='#{@linecap}'"
  end

  if @id != ""
    s += " id='#{@id}'"
  end

  return s
end 

## -----------------------------------------------------------------------
def genAttrStringSpecial()
  s = ""

  if @strokewidth != ""
    s += " stroke-width='#{@strokewidth}'"
  end

  if @transform != ""
    s += " transform='#{@transform}'"
  end

  if @opacity != ""
    s += " opacity='#{@opacity}'"
  end
  
  if @fillopacity != ""
    s += " fill-opacity='#{@fillopacity}'"
  end

  if @strokeopacity != ""
    s += " stroke-opacity='#{@strokeopacity}'"
  end

  if @dasharray != ""
    s += " stroke-dasharray='#{@dasharray}'"
  end

  if @linecap != ""
    s += " stroke-linecap='#{@lineend}'"
  end 

  return s
end 
end

