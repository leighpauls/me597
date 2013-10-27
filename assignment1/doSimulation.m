function [ ] = doSimulation()
  clf
  hold('on');
  axis equal;

  x = 0;
  y = 0;
  heading = 0;

  for t = [0:0.1:20]
    scatter(x, y, 40, 'r', 'x');
    [x, y, heading] = bikeModel(x, y, heading, (10 - t) * pi / 180, 3);
  end
end
