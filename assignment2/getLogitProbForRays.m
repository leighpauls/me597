function [logitProb] = getLogitProbForRays(x, y, clearRays, contactRays)
  % given rays which are clear and rays wihch terminate in wall contact
  % return the logit probability of point (x,y) being occupied
  ALPHA = 0.2;
  BETA = 10 * pi / 180;
  pos = [x y];
  
  % try the rays with nothing in them
  for i = [1:size(clearRays)]
    raySource = clearRays(i, 1:2);
    rayEnd = clearRays(i, 3:4);
    if withinPieSlice(pos, raySource, rayEnd, BETA)
       logitProb = logit(0.4);
       return;
    end
  end

  % try the rays the terminate with contact
  for i = [1:size(contactRays)]
    raySource = contactRays(i, 1:2);
    rayEnd = contactRays(i, 3:4);

    % make slices for the occupied and unoccupied regions, respectively
    rayVector = rayEnd - raySource;
    rayLength = hypot(rayVector(1), rayVector(2));
    rayDir = rayVector / rayLength;
    occupiedRayVector = rayDir * (rayLength + ALPHA/2);
    unoccupiedRayVector = rayDir * max(rayLength - ALPHA/2, 0);

    if withinPieSlice(pos, raySource, raySource+occupiedRayVector, BETA)
       % it's not unknown
       if withinPieSlice(pos, raySource, raySource+unoccupiedRayVector, BETA)
         % it's unoccupied
         logitProb = logit(0.4);
         return;
       end
       % it's occupied
       logitProb = logit(0.7);
       return;
    end
  end
  % this point was unknown
  logitProb = logit(0.5);
end
