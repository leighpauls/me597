function [] = testInverseScanner(groundMap, res)
  clf;
  hold;
  plotMap(groundMap, res);
  x = 1.5;
  y = 2.5;
  
  heading = -pi/2;
  [clearRays, contactRays] = simulateScans(x, y, heading, groundMap, res);
  [M, N] = size(groundMap);
  probMap = inverseScanner(M, N, clearRays, contactRays, res);
  clf;
  hold;
  plotLogitMap(probMap, res);
end
