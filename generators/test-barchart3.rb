require "./SVGTools.rb"

c = SVGTools.new

x = 50
y = 250
width = 5
#spacing = 4
spacing = 1

c.emitHeader() 

values =[]

3.times do
  10.step(200,10) do |i|
    values += [i]
  end  
  200.step(10,-10) do |i|
    values += [i]
  end  
  c.drawBarChart(x,y,values,width,spacing,false)
end

values = []
y = 500
x = 50
width = 1
spacing = 0
3.times do
  0.upto 150 do |i|
    values += [i]
  end  
  150.downto 0 do |i|
    values += [i]
  end  
  c.drawBarChart(x,y,values,width,spacing,false)
end          
c.emitFooter()                                                            


