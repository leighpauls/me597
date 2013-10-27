function [ ] = mapNavigationSimulation()
%MAPNAVIGATIONSIMULATION Summary of this function goes here
%   Detailed explanation goes here
  I = imread('IGVCmap.jpg');
  map = im2bw(I, 0.7); % Convert to 0-1 image
  map = 1-flipud(map)'; % Convert to 0 free, 1 occupied and flip.
  [M, N] = size(map); % Map size
  res = 0.1; % meters per pixel
  
  x0 = 40; y0 = 5; heading0 = pi;
  xf = 50; yf = 10;
  
  figure(1); clf; hold on; axis equal;
  % colormap('gray');
  % imagesc(1-map');
  plot(x0/res, y0/res, 'ro', 'MarkerSize', 10, 'LineWidth', 3);
  plot(xf/res, yf/res, 'gx', 'MarkerSize', 10, 'LineWidth', 3);

  makeWavefront(map, xf, yf);

end

