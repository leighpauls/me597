function [inSlice] = withinPieSlice(point, tip, midCrust, widthRadians)
% return true if point is inside of the pie slice defined by tip (The pointy part),
% midCrust (in the middle of the crust), and width in radians
  pieVector = midCrust - tip;
  len = hypot(pieVector(1), pieVector(2));
  tipToPoint = point - tip;
  centerDist = hypot(tipToPoint(1), tipToPoint(2));
  if centerDist > len
    % too far away to be in the pie
    inSlice = false;
    return;
  end
  % find the angle inside point->tip->midcrust
  insideAngle = atan2(pieVector(2), pieVector(1)) - atan2(tipToPoint(2), tipToPoint(1));
  % normalize to +/- pi range
  insideAngle = mod(insideAngle, 2*pi);
  if (insideAngle > pi)
    insideAngle = insideAngle - 2*pi;
  end

  inSlice = abs(insideAngle) < (widthRadians / 2);
  return;
end
