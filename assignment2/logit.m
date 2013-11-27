function [l] = logit(p)
  l = log(p)-log(1-p);
end
