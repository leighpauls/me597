function [point] = traceRay(startPos, endPos, map, res)
  stepLength = res / 10; % arbitrary constant
  netVector = endPos - startPos;
  steps = ceil(hypot(netVector(1), netVector(2)) / res);
  stepVector = netVector / steps;
  point = [];
  % plot([startPos(1) endPos(1)], [startPos(2) endPos(2)], 'g');
  for i = [0:steps]
    curPoint = startPos + i * stepVector;
    if mapOccupied(map, res, curPoint(1), curPoint(2))
       point = curPoint;
       return;
    end
  end
end
