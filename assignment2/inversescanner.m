function [deltaLogitProb] = inversescanner(x, y, heading, groundMap, res)
  % Calculates the inverse measurement model for a laser scanner
  % Identifies three regions, the first where no new information is
  % available, the second where objects are likely to exist and the third
  % where objects are unlikely to exist

  % offset of rangers from current position
  % specified clockwise from leftmost sensor
  sensorOffsets = [-0.15 0.1 -pi/2;
                   -0.15 0.2 -pi/4;
                   -0.05 0.2 0;
                   0.05 0.2 0;
                   0.15 0.2 pi/4;
                   0.15 0.1 pi/2];
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
    rayEnd = raySource + [(1.5*sin(rayAngle)), (1.5*cos(rayAngle))];
    %try tracing it
    newPoint = traceRay(raySource, rayEnd, groundMap, res);
    if length(newPoint) == 0
       clearRays = cat(1, clearRays, [raySource rayEnd]);
    else
      % Empty up to new point, which is occupied
      contactRays = cat(1, contactRays, [raySource newPoint]);
      % scatter(newPoint(1), newPoint(2), 'r');
    end
  end

  [M, N] = size(groundMap);
  deltaLogitProb = zeros(M, N);

  % turns the rays into cells of probability
  for i = 1:M
    for j = 1:N
      cellX = i * res - res/2;
      cellY = j * res - res/2;
      deltaLogitProb(i, j) = getLogitProbForRays(cellX, cellY, clearRays, contactRays, res);
    end
  end
end
