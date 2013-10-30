function [] = plotConnections(points, connections, col)
  hold on;
  [len, unused] = size(connections);
  for connectionIdx = [1:len]
    connection = connections(connectionIdx, :);
    pointA = points(connection(1), :);
    pointB = points(connection(2), :);
    plot([pointA(1), pointB(1)], [pointA(2), pointB(2)], col);
  end
end
