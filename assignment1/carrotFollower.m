function [x, y, heading] = carrotFollower(waypoints, r, speed, prevX, prevY, prevHeading)
  % find the closest line segment
  selectedSegment = 0;
  closestDist = inf;
  closestPos = 0;
  c = [prevX, prevY];
  for i = [1 : length(waypoints) - 1]
    % pick the closest point on the line
    a = waypoints(i,:);
    b = waypoints(i+1,:);
    ab = sqrt((a(1) - b(1))^2 + (a(2) - b(2))^2);
    ac = sqrt((a(1) - c(1))^2 + (a(2) - c(2))^2);
    bc = sqrt((b(1) - c(1))^2 + (b(2) - c(2))^2);
    
    angle = acos((bc^2 - ac^2 - ab^2) / (-2 * ac * ab));
    lenFromA = ac * cos(angle);
    if lenFromA < 0
      dist = ac;
      linePos = a;
    elseif lenFromA > ab
      dist = ab;
      linePos = b;
    else
      dist = abs(ac * sin(angle));
      linePos = a + lenFromA * (b - a) / ab;
    end

    if dist < closestDist
      closestDist = dist;
      closestPos = linePos;
      selectedSegment = i;
    end
  end

  % move `r` meters along the line
  remainingDist = r;
  carrotPos = closestPos;
  while true
    a = waypoints(selectedSegment, :);
    b = waypoints(selectedSegment + 1, :);
    carrotToB = b - carrotPos;
    distOnLine = sqrt(carrotToB(1)^2 + carrotToB(2)^2);
    if distOnLine > remainingDist
      carrotPos = carrotPos + remainingDist * carrotToB / distOnLine;
      break;
    end
    carrotPos = b;
    remainingDist = remainingDist - distOnLine;
    selectedSegment = selectedSegment + 1;
  end
  
  % steer towards the point
  toPoint = carrotPos - c;
  desiredHeading = atan2(toPoint(2), toPoint(1));
  headingError = mod(desiredHeading - prevHeading, 2*pi);
  if headingError > pi
    headingError = headingError - 2*pi;
  end
  
  steeringAngle = 1 * headingError;
  [x y heading] = bikeModel(prevX, prevY, prevHeading, steeringAngle, speed);
end
