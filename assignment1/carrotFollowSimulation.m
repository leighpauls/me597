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

  x = 10;
  y = 1;
  heading = 0;
  for t = [0:0.1:15]
    [x y heading] = carrotFollower(waypoints, 1, 3, x, y, heading);
    scatter(x, y, 40, 'r', 'x');
  end
end

