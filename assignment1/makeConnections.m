function [connections] = makeConnections(map, res, points)
  connections = [];
  for i = [1:length(points)]
    for j = [i + 1:length(points)]
      if not(lineHasCollisions(map, res, points(i,:), points(j,:)))
         % i will always be less than j
         connections = cat(1, connections, [i, j]);
      end
    end
  end
end
