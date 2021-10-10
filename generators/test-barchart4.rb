require "./SVGTools.rb"

@c = SVGTools.new

def drawBars()
  values = []
  colors = ["red","blue","green","yellow","purple"]
  x = 50
  y = 350
  width = 5
  #spacing = 4
  spacing = 1   
  300.step(5,-5) do |i|
    values += [i]
  end  
  5.step(300,5) do |i|
    values += [i]
  end  
  @c.drawBarChart(x,y,values,width,spacing,false,colors)
end

@c.emitHeader() 

drawBars()
puts "<g transform='matrix(1 0 0 -1 0 350)'>"
#puts "<g transform='matrix(1 0 0 -1 0 700)'>"
drawBars()
puts "</g>"
#drawBars()         
@c.emitFooter()                                                            



