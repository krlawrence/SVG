require "./SVGTools.rb"  
c = SVGTools.new 

c.setTitle("Average temperatures")
c.emitHeader()

x = 100
y = 4`00

temps = [56,58,61,73,86,93,96,99,92,88,78,60]
vals = temps.map {|n| n* 2}

c.drawBarChart(x,y,vals,width=20)
c.endGroup()
c.emitFooter()             



