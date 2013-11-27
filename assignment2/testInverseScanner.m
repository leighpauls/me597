function [] = testInverseScanner(groundMap, res)
  clf;
  hold;
  plotMap(groundMap, res);
  x = 1;
  y = 0.75;
  heading = 0;
  probMap = inverseScanner(x, y, heading, groundMap, res);
  plotLogitMap(probMap, res);
end
