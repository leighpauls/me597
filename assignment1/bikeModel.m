function [x y heading] = bikeModel(prevX, prevY, prevHeading, steerAngle, speed)
%BIKEMODEL state-space update of this particular bike simulation
         if steerAngle > 30 * pi / 180
            steerAngle = 30 * pi / 180
         end
         if steerAngle < -30 * pi / 180
            steerAngle = -30 * pi / 180
         end
         [x y heading] = ackermann(0.1, 0.3, prevX, prevY, prevHeading, steerAngle, speed);
end

