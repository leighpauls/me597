function [points, connections, path] = doMapTraverse()
  clf;
  hold on;
  [map, res] = loadMap();

  % make some random points
  points = makeBridgePoints(map, res, 150, 10);
  % points = makeBridgePoints(map, res, 10, 10);
  plotMap(map, res);
  startPos = [40, 5];
  endPos = [50, 10];
  % startPos = [10, 10];
  % endPos = [10, 20];
  
  made_points = true

  % draw the points
  scatter(points(:, 1), points(:, 2), 'b');
  scatter(startPos(1), startPos(2), 'g');
  scatter(endPos(1), endPos(2), 'r');

  % connect the points into a graph
  points = cat(1, startPos, endPos, points);
  connections = makeConnections(map, res, points);
  % plotConnections(points, connections, 'y');

  made_connections = true

  % find a path through the graph
  path = selectPath(points, connections, 1, 2, length(points));
  % turn path in to a conneciton list
  pathConnections = [];
  for i = [1:length(path)-1]
    pathConnections = cat(1, pathConnections, [path(i), path(i+1)]);
  end
  plotConnections(points, pathConnections, 'r');

  made_path = true
end
