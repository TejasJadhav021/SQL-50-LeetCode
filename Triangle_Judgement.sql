select x, y, z , IF(y+z>x and x+y>z and x+z>y , "Yes", "No") as triangle from Triangle 
