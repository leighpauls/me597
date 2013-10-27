%% Planning map


I = imread('IGVCmap.jpg');
map = im2bw(I, 0.7); % Convert to 0-1 image
map = 1-flipud(map)'; % Convert to 0 free, 1 occupied and flip.
[M,N]= size(map); % Map size

% Robot start position
dxy = 0.1;
x0 = [40 5 pi];

% Target location
xF = [50 10];

% Plotting
figure(1); clf; hold on;
colormap('gray');
imagesc(1-map');
plot(x0(1)/dxy, x0(2)/dxy, 'ro', 'MarkerSize',10, 'LineWidth', 3);
plot(xF(1)/dxy, xF(2)/dxy, 'gx', 'MarkerSize',10, 'LineWidth', 3 );
axis equal
