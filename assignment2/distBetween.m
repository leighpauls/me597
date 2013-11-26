function [dist] = distBetween(p1, p2)
  dist = hypot(p1(1)-p2(1), p1(2)-p2(2));
end
