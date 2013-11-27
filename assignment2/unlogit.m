function [p] = unlogit(l)
  p = exp(l)/(1+exp(l));
end
