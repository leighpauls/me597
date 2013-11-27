function [clearRays, contactRays] = simulateScans(x, y, heading, groundMap, res)
  % offset of rangers from current position
  % specified clockwise from leftmost sensor
  sensorOffsets = [0.1, 0.15, pi/2;
                   0.2, 0.15, pi/4;
                   0.2, 0.05, 0;
                   0.2, -0.05, 0;
                   0.2, -0.15, -pi/4;
                   0.1, -0.15, -pi/2];
  % rays which found no contacts
  clearRays = [];
  % rays which terminate with a contect
  contactRays = [];

  % find all the rays in this scan
  for i = [1:length(sensorOffsets)]
    % build a ray to trace
    xOffset = sensorOffsets(i, 1);
    yOffset = sensorOffsets(i, 2);
    rotOffset = sensorOffsets(i, 3);
    raySource = [(x + xOffset * cos(heading) - yOffset * sin(heading)), (y + xOffset * sin(heading) + yOffset * cos(heading))];
    rayAngle = heading + rotOffset;
    rayEnd = raySource + [(1.5*cos(rayAngle)), (1.5*sin(rayAngle))];
    %try tracing it
    newPoint = traceRay(raySource, rayEnd, groundMap, res);
    if length(newPoint) == 0
       clearRays = cat(1, clearRays, [raySource rayEnd]);
    else
      % Empty up to new point, which is occupied
      contactRays = cat(1, contactRays, [raySource newPoint]);
    end
  end
end
