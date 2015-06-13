function onMouseClick(h, e)
% callback function to calculate a waveform depending on the mouseClick 
% and draw it
% Used in superSinusGUI
% Input Parameter:
%	 h: 		 handle of current axes (unused)
%    e:          event of current axes (unused)
%------------------------------------------------------------------------ 

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 18-May-2015  Initials DB and SV
% Ver. 0.10 added circular plot 19-May-2015  Initials DB and SV
% Ver. 0.11 no fixed circular plot 23-May-2015  Initials DB and SV
% Ver. 0.12 only 2 clicks possible 23-May-2015  Initials DB and SV
% Ver. 0.20 animation 23-May-2015  Initials DB and SV
% Ver. 0.21 faster animation 10-Jun-2015 Initials DB and SV
% Ver. 0.22 animation an calculation seperated 11-Jun-2015 Initials DB and SV
% Ver. 0.23 parameters global 11-Jun-2015 Initials DB and SV

% get global variables
global zSum i y0 f p;
i=1;
T = 1/f;

% stop old timers if exist (from previous wave animations)
if ~isempty(timerfind)
    stop(timerfind);
    delete(timerfind);
end

% How many frames will be generated
frames = 3;
if isempty(get(gcf, 'UserData'))
    % first, there is no previous wave function
    zSum = cell(frames,1);
    zSum(:) = {0};
    set(gcf, 'UserData', 'clickedAtLeastOnce');
end


% get clicked position and save it for later use
point = get( gca(), 'CurrentPoint' );

% get center for the circular plot
xClick = point(1,1);
yClick = point(1,2);

% fill x and y
[x,y] = meshgrid(-4:.1:4);

% initialize z for all frames
z=cell(frames,1);
% calculate z for the specific parameters.
% zSum is added to create interferences 
k=0;
t = linspace(0,T,frames+1);
for t=t(1:end-1)
    k=k+1;
    % circular wave function
    r = sqrt((x-xClick).^2+(y-yClick).^2);
    z{k} = y0*sin(2*pi*( r-f*t+p) ) + zSum{k};

    % save current wavefunction results for later use:
    zSum{k} = z{k};
end

% start timer for animation purposes
myTimer = timer('Period', 1/frames, 'TimerFcn', {@drawFrame, x,y,z, frames}, 'ExecutionMode', 'FixedRate');
start(myTimer);
uiwait(gcf());

% clear global variables to avoid declaring the global after it has been referenced. 
clear zSum i y0 f p;

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