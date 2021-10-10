PI = Math::PI

r  = 150
cx = 200
cy = 200

0.step(360,45) do |a|
  x2 = cx + (180*Math.cos(PI*a/180)).round
  y2 = cy + (180*Math.sin(PI*a/180)).round
  puts"#{x2}  #{y2}"
end
