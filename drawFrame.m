function drawFrame(timer, timerInfo,x,y,z, frames)
% callback from timer to draw a frame from given x,y and z

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 23-May-2015  Initials DB and SV
% Ver. 0.02 faster animation 10-Jun-2015 Initials DB and SV
% Ver. 0.03 animation and calculation seperated 11-Jun-2015 Initials DB and SV
% Ver. 0.04 adjusted color for consistency in GUI 13-Jun-2015 Initials DB and SV

global i;

% plot using contourf
set(gcf(), 'Renderer', 'OpenGL'); % fast rendering
contourf(x,y,z{i}, 'ButtonDownFcn', @onMouseClick);
set(gca, 'xtick',[], 'ytick',[]); % no axis visible
colormap hsv;

% iterate through every frame and start from the beginning, if there are no
% frames left
i=i+1;
if i>frames
    i=1;
end

% clear global variable to avoid declaring the global after it has been referenced. 
clear i;

%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> Daniel Budelmann and Sebastian Voges
% Jade University of Applied Sciences 
% Permission is hereby granted, free of charge, to any person obtaining 
% a copy of this software and associated documentation files 
% (the "Software"), to deal in the Software without restriction, including 
% without limitation the rights to use, copy, modify, merge, publish, 
% distribute, sublicense, and/or sell copies of the Software, and to
% permit persons to whom the Software is furnished to do so, subject
% to the following conditions:
% The above copyright notice and this permission notice shall be included 
% in all copies or substantial portions of the Software.
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.