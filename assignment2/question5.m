function [] = question5(points)
  x = points(1,1);
  y = points(1,2);
  points = points(2:end,:);
  heading = -pi;

%   points = [0.75, 2.25;
%             2.5, 2.25;
%             2.5, 0.25;
%             4.75, 0.25;
%             4.75, 2.75;
%             4.75, 1.75;
%             3.75, 1.75;
%             3.75, 2.25];
  curPoint = 1;

  [groundMap, res] = loadMap();
  res = res
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
    probMap = probMap + inversescanner(M, N, clearRays, contactRays, res);
    positions = cat(1, positions, [x y]);
    [i x y heading]
  end
  clf;
  hold 'on';
  plotLogitMap(probMap, res);
  scatter(positions(:,1), positions(:,2));
end