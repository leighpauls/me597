function [] = question3()
  % these kinematics probably work
  positions = [];
  % for timestep = 1s

  % build up some path to take
  for y = [0.15:0.1:2.25]
    positions = cat(1, positions, [0.75, y, pi/2]);
  end
  for heading = [pi/2:-0.1:0]
    positions = cat(1, positions, [0.75, 2.25, heading]);
  end
  for x = [0.75:0.1:2.5]
    positions = cat(1, positions, [x, 2.25, 0]);
  end
  for heading = [0:-0.1:-pi/2]
    positions = cat(1, positions, [2.5, 2.25, heading]);
  end
  for y = [2.25:0.1:0.25]
    positions = cat(1, positions, [2.5, y, -pi/2]);
  end
  for heading = [-pi/2:0.1:0]
    positions = cat(1, positions, [2.5, 0.25, heading]);
  end
  for x = [2.5:0.1:4.25]
    positions = cat(1, positions, [x, 0.25, 0]);
  end
  for heading = [0:0.1:pi/2]
    positions = cat(1, positions, [4.25, 0.25, heading]);
  end

  length(positions)

  x = 0.75;
  y = 0.25;
  heading = -pi;

  points = [0.75, 2.25;
            2.5, 2.25;
            2.2, 0.25];
  curPoint = 1;

  [groundMap, res] = loadMap();
  [M, N] = size(groundMap);
  probMap = zeros(M, N);
  while curPoint <= length(points)
    [x y heading atPoint] = driveToPoint(x, y, heading, points(curPoint, 1), points(curPoint, 2), 0.1);
    if atPoint
      curPoint = curPoint + 1;
    end
    % [clearRays, contactRays] = simulateScans(positions(i, 1), positions(i, 2), positions(i, 3), groundMap, res);
    [clearRays, contactRays] = simulateScans(x, y, heading, groundMap, res);
    probMap = probMap + inverseScanner(M, N, clearRays, contactRays, res);
    [x y heading]
  end
  clf;
  hold 'on';
  plotLogitMap(probMap, res);
end
