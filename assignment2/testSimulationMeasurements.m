function [] = testSimulationMeasurements(map, res)
  clf;
  hold;
  plotMap(map, res);
  x = 1;
  y = 0.75;
  heading = 0;
  points = simulationMeasurements(x, y, heading, map, res)
  for i = [1:length(points)]
    scatter(points(i,1), points(i, 2), 'b');
  end
  scatter(x, y, 'r');
end
