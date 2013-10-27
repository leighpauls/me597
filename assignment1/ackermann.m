function [x y heading] = ackermann(dt, length, prevX, prevY, prevHeading, steerAngle, speed)
%ACKERMANN state-space update of ackermann steering model
         dist = speed * dt;
         x = prevX + dist * cos(prevHeading) + normrnd(0, 0.02) * dt;
         y = prevY + dist * sin(prevHeading) + normrnd(0, 0.02) * dt;
         dHeading = steerAngle - asin((length - dist) * sin(pi - steerAngle) / length);
         heading = prevHeading + dt * (dHeading) + normrnd(0, 0.02 * pi / 180) * dt;
end

