function [] = plotMap(map, res)
  hold on;
  axis equal;
  colormap('gray');
  mapSize = size(map);
  drawSize = floor(mapSize * res);
  imagesc([0 drawSize(1)], [0 drawSize(2)], 1-map');
end
