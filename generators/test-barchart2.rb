require "./SVGTools.rb"

c = SVGTools.new

x = 50
y = 250
width = 10
#spacing = 4
spacing = 1

c.emitHeader() 

# values = [10,20,30,40,50,60,70,60,50,40,30,20,10,20,30, 
# 40,50,60,70,60,50,40,30,20,10,20,30,40,50,60,70,60,50,40,30,20,10]

values =[]

10.step(200,10) do |i|
  values += [i]
end  
200.step(10,-10) do |i|
  values += [i]
end  

c.drawBarChart(x,y,values,width,spacing,false)

c.emitFooter()                                                            


