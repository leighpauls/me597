function [] = question3()
  x = 1.0;
  y = 0.25;
  heading = -pi;

  points = [1.0, 1.0;
            0.5, 1.75;
            1.0, 2.5;
            2.5, 2.5;
            2.5, 0.25;
            4.75, 0.25;
            4.75, 2.75;
            4.75, 2.0;
            3.75, 2.0;
            3.75, 2.75];
  curPoint = 1;

  [groundMap, res] = loadMap();
  [M, N] = size(groundMap);
  probMap = zeros(M, N);
  positions = [];
  for i = [1:200]
    [x y heading atPoint] = driveToPoint(x, y, heading, points(curPoint, 1), points(curPoint, 2), 1.0);
    if atPoint
      curPoint = curPoint + 1;
    end
    % [clearRays, contactRays] = simulateScans(positions(i, 1), positions(i, 2), positions(i, 3), groundMap, res);
    [clearRays, contactRays] = simulateScans(x, y, heading, groundMap, res);
    probMap = probMap + inverseScanner(M, N, clearRays, contactRays, res);
    positions = cat(1, positions, [x y]);
    [i x y heading]
  end
  clf;
  hold 'on';
  plotLogitMap(probMap, res);
  scatter(positions(:,1), positions(:,2));
end
