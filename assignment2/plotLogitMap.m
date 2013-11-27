function [] = plotLogitMap(probMap, res)
  [M, N] = size(probMap);
  for i = 1:M
    for j = 1:N
      prob = 1-unlogit(probMap(i, j));
      rectangle('Position', [(i-1)*res, (j-1)*res, res, res], 'FaceColor', [prob, prob, prob])
    end
  end
end
