function onMouseClick(h, e)
% callback function to get Position of mouse Click
% Used in superSinusGUI
% Input Parameter:
%	 h: 		 handle
%    e:          event
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

global myTimer;
global zSum;
global i;
i=1;
global y0;
global f;
T = 1/f;
global p;

% stop old timers if exist
if ~isempty(timerfind)
    stop(timerfind);
    delete(timerfind);
end

% How many frames will be generated
frames = 3;
if isempty(get(gcf, 'UserData'))
    % first, there is no wave function
    zSum = cell(frames,1);
    zSum(:) = {0};    
    set(gcf, 'UserData', '2ndPass');
end


% get clicked position and save it for later use
point = get( gca(), 'CurrentPoint' );

% get center for the circular plot
xClick = point(1,1);
yClick = point(1,2);

% fill x and y
[x,y] = meshgrid(-4:.1:4);

% calculate time difference
z=cell(frames,1);k=0;
t = linspace(0,T,frames+1);
for t=t(1:end-1)
    k=k+1;
    % circular wave function
    r = sqrt((x-xClick).^2+(y-yClick).^2);
    z{k} = y0*sin(2*pi*( r-f*t+p) ) + zSum{k};

    % save current wavefunction for later use:
    zSum{k} = z{k};
end

% Timer
myTimer = timer('Period', 1/frames, 'TimerFcn', {@drawWaves, x,y,z, frames}, 'ExecutionMode', 'FixedRate');
start(myTimer);
uiwait(gcf());

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