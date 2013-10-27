function [x y heading] = ackermann(dt, length, prevX, prevY, prevHeading, steerAngle, speed)
  %ACKERMANN state-space update of ackermann steering model
  dist = speed * dt;
  dHeading = speed * tan(steerAngle) / length;
  heading = prevHeading + dt * (dHeading) + normrnd(0, 0.02 * pi / 180) * dt;
  avgHeading = (heading + prevHeading) / 2;
  x = prevX + dist * cos(avgHeading) + normrnd(0, 0.02) * dt;
  y = prevY + dist * sin(avgHeading) + normrnd(0, 0.02) * dt;
end

