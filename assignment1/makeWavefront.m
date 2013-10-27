function [wavefront] = makeWavefront(map, destX, destY)
%MAKEWAVEFRONT Summary of this function goes here
  %   Detailed explanation goes here
  [width, height] = size(map);
  wavefront = ones(width, height) * inf;
  wavefront(destX, destY) = 0;

  lastPositions = [destX, destY];
  curDist = 1;
  around = [-1 -1; 0 -1; 1 -1;
            -1  0;       1  0;
            -1  1; 0  1; 1  1];
  while length(lastPositions) > 0
    % for cell added last time
    nextPositions = [];
    for pos = lastPositions'
      for delta = around'
        newPos = pos + delta;
        if (not(map(newPos(1), newPos(2)))) && (wavefront(newPos(1), newPos(2)) > curDist)
          wavefront(newPos(1), newPos(2));
          nextPositions = cat(1, nextPositions, newPos');
          plot(newPos(1), newPos(2), 'Color', [0, 0, curDist/1000], 'Marker', '.');
        end
      end
    end
    curDist = curDist + 1;
    lastPositions = nextPositions;
  end
end

