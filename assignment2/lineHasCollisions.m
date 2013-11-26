function [hasCollision] = lineHasCollisions(map, res, pointA, pointB)
  aToB = (pointB - pointA);
  numSteps = ceil(hypot(aToB(1), aToB(2)) / res);
  stepVector = aToB / numSteps;
  for i = [1:numSteps]
      testPoint = pointA + stepVector * i;
      if mapOccupied(map, res, testPoint(1), testPoint(2))
         hasCollision = true;
         return
      end
  end
  hasCollision = false;
end
