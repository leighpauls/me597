% Wavefront example
clear all; close all; clc

%% Create AVI object
vidObj = VideoWriter('wavefront.avi');
vidObj.Quality = 100;
vidObj.FrameRate = 5;
open(vidObj);

% Vehicle start and end position
startPos = [0.3 0.3];
endPos = [4.7 2.7];
x = startPos(1);
y = startPos(2);
heading = pi;

curPoint = 1;

[groundMap, res] = loadMap();
[M, N] = size(groundMap);
%map = 0.5*ones(size(groundMap));

probMap = zeros(M, N);
positions = [];
[wavemap path] = wavefront(probMap, startPos, endPos);
path = path*res;
while (true)
    
    [x y heading atPoint] = driveToPoint(x, y, heading, path(2, 1), path(2, 2), 1.0);
    [clearRays, contactRays] = simulateScans(x, y, heading, groundMap, res);
    probMap = probMap + inversescanner(M, N, clearRays, contactRays, res);
    
    if atPoint
        startPos = [path(2, 1), path(2, 2)];
        if (startPos == endPos)
            break;
        end
        [wavemap path] = wavefront(probMap, startPos, endPos);
        path = path*res;
        text = 'updating wave'
    end
    
    % [clearRays, contactRays] = simulateScans(positions(i, 1), positions(i, 2), positions(i, 3), groundMap, res);

    positions = cat(1, positions, [x y]);
    [i x y heading]
    figure(2);
    hold on;
    plotLogitMap(probMap, res);
    scatter(positions(:,1), positions(:,2));
    
    
    curPoint = 1;    
end
