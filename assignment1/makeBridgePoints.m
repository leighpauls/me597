function [ bridgedPoints ] = makeBridgePoints(map, res, numPoints, bridgeStdDev)
  mapSize = size(map) * res;
  bridgedPoints = [];
  while length(bridgedPoints) < numPoints
    point1 = [rand() * mapSize(1), rand() * mapSize(2)];
    point2 = normrnd(point1, bridgeStdDev);
    if (not(mapOccupied(map, res, point1(1), point1(2))) || not(mapOccupied(map, res, point2(1), point2(2))))
      continue;
    end
    newPoint = (point1 + point2) / 2;
    if mapOccupied(map, res, newPoint(1), newPoint(2))
      continue;
    end
    bridgedPoints = cat(1, bridgedPoints, newPoint);
  end
end
