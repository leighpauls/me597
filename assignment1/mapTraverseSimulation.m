function [] = mapTraverseSimulation(points, path)
  clf;
  hold on;

  % draw the map
  [map, res] = loadMap();
  plotMap(map, res);

  % draw the pre-computed information
  scatter(points(:, 1), points(:, 2), 'b');
  scatter(points(1, 1), points(1, 2), 'g'); 
  scatter(points(2, 1), points(2, 2), 'r'); 
  
  % turn path in to a conneciton list
  pathConnections = [];
  for i = [1:length(path)-1]
    pathConnections = cat(1, pathConnections, [path(i), path(i+1)]);
  end
  plotConnections(points, pathConnections, 'r');

  % build the waypoints
  waypoints = [];
  for node = path
    waypoints = cat(1, waypoints, points(node,:));
  end
  x = 40;
  y = 5;
  heading = pi;
  while distBetween(points(2,:), [x y]) > 1
    [x y heading] = carrotFollower(waypoints, 1, 3, x, y, heading);
    scatter(x, y, 'c', 'x');
  end
end
