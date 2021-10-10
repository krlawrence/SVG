require "./SVGTools.rb"

c = SVGTools.new

x = 50
y = 300
width = 10
spacing = 4

c.emitHeader()

values = [100,80,30,155,90,58,42]

c.drawBarChart(x,y,values,width,spacing)

x += values.length*(width+spacing) + 100
width += 10
c.drawBarChart(x,y,values,width,spacing)

x += values.length*(width+spacing) + 100
width = 50 
values2 = values[1..4]
c.drawBarChart(x,y,values2,width,spacing)  

x = 50
y = 700
width = 20
values3 = []
0.upto 30 do |i|
  values3[i] = rand(250)
end
c.drawBarChart(x,y,values3,width,spacing)   

c.emitFooter()                                                            

