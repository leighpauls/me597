function [ ] = carrotFollowSimulation()
%CARROTFOLLOWSIMULATION Summary of this function goes here
%   Detailed explanation goes here
  clf;
  hold('on');
  axis equal;
  waypoints = [0 0; 20 0; 20 5; 0 5; 0 0; 20 0];
  % draw the waypoints
  for i = [1 : length(waypoints) - 1]
    plot([waypoints(i,1), waypoints(i+1,1)], [waypoints(i,2), waypoints(i+1,2)]);
  end

  x = 1;
  y = 0;
  heading = 0;
  for t = [0:0.1:20]
    [x y heading] = carrotFollower(waypoints, 5, 3, x, y, heading);
    if mod(t, 0.5) == 0
      scatter(x, y, 40, 'r');
    end
  end
end

