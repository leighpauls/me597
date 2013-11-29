function [x y heading atPoint] = driveToPoint(prevX, prevY, prevHeading, destX, destY, deltaTime)
  headingToPoint = atan2(destY-prevY, destX-prevX);
  headingError = headingToPoint - prevHeading;
  % normalize heading error
  headingError = mod(headingError, 2*pi);
  if headingError > pi
     headingError = headingError - 2*pi;
  end

  SPEED = 1.0;
  TURN_RATE = 1.0;

  distError = hypot(destX - prevX, destY - prevY);
  atPoint = false;

  if distError < SPEED * deltaTime
     x = destX;
     y = destY;
     heading = prevHeading;
     atPoint = true;
  elseif abs(headingError) < 0.01
    heading = prevHeading;
    x = prevX + SPEED * cos(heading) * deltaTime;
    y = prevY + SPEED * sin(heading) * deltaTime;
  else
    x = prevX;
    y = prevY;
    if abs(headingError) < (TURN_RATE * deltaTime)
      heading = headingToPoint;
    else
      heading = prevHeading + sign(headingError) * TURN_RATE * deltaTime;
    end
  end
end
