function [pathPoints] = selectPath(connections, startNode, endNode, numNodes)
  connectionMap = containers.Map(1, [1 1]);
  connectionMap.remove(1);
  % build the connection map
  for i = [1:numNodes]
    connectionMap(i) = [];
  end
  for i = [1:length(connections)]
    curConn = connections(i,:);
    a = curConn(1);
    b = curConn(2);
    connectionMap(a) = cat(1, connectionMap(a), b);
    connectionMap(b) = cat(1, connectionMap(b), a);
  end
  visitedPoints = [startNode];
  pathMap = containers.Map(1, [1, 1]);
  pathMap.remove(1);
  pathMap(startNode) = [startNode];
  toExpand = [startNode];
  while not(pathMap.isKey(endNode)) && (length(toExpand) > 0)
    nextToExpand = [];
    for i = [1:length(toExpand)]
      % for each node visted last cycle
      expandingNode = toExpand(i);
      pathTaken = pathMap(expandingNode);
      expandingConnections = connectionMap(expandingNode);
      for j = [1:length(expandingConnections)]
        % for each node connected to the expanding node
        newConnection = expandingConnections(j);
        if not(pathMap.isKey(newConnection))
          % this connection is unexplored
          pathMap(newConnection) = cat(1, pathTaken, newConnection);
          nextToExpand = cat(1, nextToExpand, newConnection);
        end
      end
    end
    toExpand = nextToExpand;
  end
  pathPoints = pathMap(endNode);
end
