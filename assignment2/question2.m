function [] = question2()
  x = 1.5;
  y = 2.5;

  N = 40;
  M = 40;
  heading = -pi/2;

  % hand-calculated rays to meet the given distances
  clearRays = [1.6500    2.3000    2.7107    1.2393;
               1.5500    2.3000    1.5500    0.8000;
               1.3500    2.4000   -0.1500    2.4000];
  contactRays = [1.6500    2.4000    2.6500    2.4000;
                 1.4500    2.3000    1.4500    1.5000;
                 1.3500    2.3000    0.5642    1.4905];

  probMap = inverseScanner(M, N, clearRays, contactRays, 0.1);
  clf;
  hold;
  plotLogitMap(probMap, 0.1);
end
