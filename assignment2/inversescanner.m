function [deltaLogitProb] = inverseScanner(M, N, clearRays, contactRays, res)
  % Calculates the inverse measurement model for a laser scanner
  % Identifies three regions, the first where no new information is
  % available, the second where objects are likely to exist and the third
  % where objects are unlikely to exist

  deltaLogitProb = zeros(M, N);
  % turns the rays into cells of probability
  for i = 1:M
    for j = 1:N
      cellX = i * res - res/2;
      cellY = j * res - res/2;
      deltaLogitProb(i, j) = getLogitProbForRays(cellX, cellY, clearRays, contactRays, res);
    end
  end
end
