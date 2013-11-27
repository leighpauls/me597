function [newProbMap] = simulationMeasurements(x, y, heading, probMap, groundMap, res)
  sensorOffsets = [-0.15 0.1 -pi/2;
                   -0.15 0.2 -pi/4;
                   -0.05 0.2 0;
                   0.05 0.2 0;
                   0.15 0.2 pi/4;
                   0.15 0.1 pi/2]
  
  for i = [1:length(sensorOffsets)]
    % build a ray to trace
    xOffset = sensorOffsets(i, 1);
    yOffset = sensorOffsets(i, 2);
    rotOffset = sensorOffsets(i, 3);
    raySource = [(x + xOffset * cos(heading) - yOffset * sin(heading)) (y + xOffset * sin(heading) + yOffset * cos(heading))]
    rayAngle = heading + rotOffset;
    rayEnd = raySource + [(1.5*sin(rayAngle)), (1.5*cos(rayAngle))];
    %try tracing it
    newPoint = traceRay(raySource, rayEnd, map, res);
    if length(newPoint) == 0
      % this entire line was empty
      newProbMap = updateMapRegion(raySource, rayEnd, 
    else
      % Empty up to new point, which is occupied
      newProbMap = updateMapRegion(raySource, rayEnd
    end
  end
end
