function [ ] = doSimulation()
         x = 0;
         y = 0;
         heading = 0;
         hold('on');
         axis equal;
         for t = [0:0.1:20]
             if mod(t, 1.0) == 0
               scatter(x, y, 40, 'r');
             end
             [x, y, heading] = bikeModel(x, y, heading, (10 - t) * pi / 180, 3);
         end
end

