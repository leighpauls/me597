function [measuredPoints] = measurementModel(x, y, heading, map, res)
  sensorOffsets = [-0.15 0.1 pi/2;
                   -0.15 0.2 pi/4;
                   -0.05 0.2 0;
                   0.05 0.2 0;
                   0.15 0.2 -pi/4;
                   0.15 0.1 -pi/2]
  measuredPoints = [];
  for i = [1:length(sensorOffsets)]
    xOffset = sensorOffsets(i, 1);
    yOffset = sensorOffsets(i, 2);
    rotOffset = sensorOffsets(i, 3);
    raySource = [(x + xOffset * cos(heading) - yOffset * sin(heading))
                 (y + xOffset * sin(heading) + yOffset * cos(heading))];
    rayAngle = heading + rotOffset;
    rayEnd = raySource + [(1.5*cos(rayAngle)) (1.5*sin(rayAngle))];
    newPoint = traceRay(raySource, rayEnd);
    if length(newPoint) > 0
       % TODO: add ray tracing
    end
  end
end
