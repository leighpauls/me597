function [isOccupied] = mapOccupied(map, res, x, y)
%MAPOCCUPIED Summary of this function goes here
%   Detailed explanation goes here
  pos = floor([x, y] / res);
  mapSize = size(map);
  if pos(1) < 1 || pos(2) < 1 || pos(1) > mapSize(1) || pos(2) > mapSize(2)
    isOccupied = false;
    return;
  end
  isOccupied = map(floor(x / res), floor(y / res));
end

