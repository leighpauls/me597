function [pathPoints] = selectPath(points, connections, startNode, endNode, numNodes)
  connectionMap = containers.Map(1, [1 1]);
  connectionMap.remove(1);
  distMap = containers.Map(1, 1);
  distMap.remove(1);
  % build the connection map
  for i = [1:numNodes]
    connectionMap(i) = [];
    distMap(i) = inf;
  end
  for i = [1:length(connections)]
    curConn = connections(i,:);
    a = curConn(1);
    b = curConn(2);
    connectionMap(a) = cat(1, connectionMap(a), b);
    connectionMap(b) = cat(1, connectionMap(b), a);
  end
  pathMap = containers.Map(1, [1, 1]);
  pathMap.remove(1);
  pathMap(startNode) = [startNode];
  distMap(startNode) = 0;
  toExpand = [startNode];
  totalBestDist = inf;
  while length(toExpand) > 0
    nextToExpand = [];
    for i = [1:length(toExpand)]
      % for each node visted last cycle
      expandingNode = toExpand(i);
      pathTaken = pathMap(expandingNode);
      distTaken = distMap(expandingNode);
      expandingConnections = connectionMap(expandingNode);
      for j = [1:length(expandingConnections)]
        % for each node connected to the expanding node
        newConnection = expandingConnections(j);
        newDist = distTaken + distBetween(points(expandingNode,:), points(newConnection,:));
        bestNextDist = newDist + distBetween(points(expandingNode,:), points(endNode,:));
        if newDist < distMap(newConnection) && bestNextDist < totalBestDist
          % this connection is unexplored
          pathMap(newConnection) = cat(1, pathTaken, newConnection);
          distMap(newConnection) = newDist;
          nextToExpand = cat(1, nextToExpand, newConnection);
          if newConnection == endNode
             totalBestDist = newDist
          end
        end
      end
    end
    toExpand = nextToExpand;
  end
  pathPoints = pathMap(endNode);
end
