require "./SVGTools.rb"

c = SVGTools.new

c.setMetaData("script-version",1)
c.setMetaData("script-params","")
c.setTitle("Title goes here")
c.emitHeader(800,800)

c.setFill("")
c.setStroke("")
c.newGroup( stroke="none",fill="none")

c.endGroup()

c.emitFooter()



