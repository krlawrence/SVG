require "./SVGTools.rb"

c = SVGTools.new 

c.setTitle("Randomly generated regular polygon")
c.emitHeader()

#tx = [200,500,200,500]
tx = [200,500,200,500]
#ty = [200,200,460,460]
ty = [200,200,500,500]
PI = Math::PI

r  = 150

if ARGV[0] == nil
  inc = 360.0/10.0
else
  inc = 360.0/ARGV[0].to_f;
end

c.newGroup(stroke="none",fill="none",fillopacity="0.8")
4.times do |t|  
  i = 0

  cx = tx[t]
  cy = ty[t]
  c.setFillOpacity("")
  #c.setTransform("rotate(22.5,#{cx},#{cy}")
  #c.newGroup()
  #c.setTransform("")
  data = ""
  points = []


  #0.step(360,inc) do |a|
  270.step(630,inc) do |a|
    x2 = cx + (r*Math.cos(PI*a/180)).round
    y2 = cy + (r*Math.sin(PI*a/180)).round
    points += [x2,y2]
  end

  n = 0
  i = 0
  0.step(points.length-4,2) do
    #c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    #c.setFill((i%2==0) ? "blue" : "red" )
    #if i == 1
    #  fill = "black"
    #elsif i == 2
    #  fill = "purple"
    #else
    #  fill = "yellow"
    #end
    #c.setFill(fill)

    i += 1
    if i > 3
      i = 1
    end

    mpx = (points[n] + points[n+2]) / 2
    mpy = (points[n+1] + points[n+3]) / 2
    #c.setFill((i%2==0) ? "blue" : "white" ) 
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    data =  "M #{cx},#{cy} L #{points[n]},#{points[n+1]} L #{mpx},#{mpy} z"
    c.drawPath(data) 
    i += 1
    #c.setFill((i%2==0) ? "blue" : "red" ) 
    c.setFill("rgb(#{rand(255)},#{rand(255)},#{rand(255)})")
    data =  "M #{cx},#{cy} L #{mpx},#{mpy} L #{points[n+2]},#{points[n+3]} z"
    c.drawPath(data) 
    n += 2
  end
  #c.endGroup()
end
c.endGroup()
c.emitFooter()


