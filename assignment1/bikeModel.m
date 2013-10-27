function [x y heading] = bikeModel(prevX, prevY, prevHeading, steerAngle, speed)
  %BIKEMODEL state-space update of this particular bike simulation
  maxSteering = 30 * pi / 180;
  if steerAngle > maxSteering
    steerAngle = maxSteering;
  end
  if steerAngle < -maxSteering
    steerAngle = -maxSteering;
  end
  [x y heading] = ackermann(0.1, 0.3, prevX, prevY, prevHeading, steerAngle, speed);
end

