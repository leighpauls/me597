function [map, res] = loadMap()
  I = imread('map.png');
  map = im2bw(I, 0.7); % Convert to 0-1 image
  map = 1-flipud(map)'; % Convert to 0 free, 1 occupied and flip.
  res = 0.1;
end
