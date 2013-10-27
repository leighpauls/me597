function [isOccupied] = mapOccupied(map, res, x, y)
%MAPOCCUPIED Summary of this function goes here
%   Detailed explanation goes here
  isOccupied = map(floor(x / res), floor(y / res));
end

