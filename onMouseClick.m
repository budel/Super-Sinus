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

% Check the click count
drawCircularWave = true;
clickCount = get(gcf, 'UserData');
if isempty(clickCount)
%   First Wave
    set( gcf, 'UserData', 1 );
elseif clickCount == 1 
    set( gcf, 'UserData', 2 );
else
    % no more circular waves!
    drawCircularWave = false;
end

% get clicked position and save it for later use
point = get( gca(), 'CurrentPoint' );
% Amplitude
y0 = 1;
% Frequency 
f = 1/(2*pi);
% Phase
p = 0;

if drawCircularWave    
    % get current time as a starting point    
    c=clock;
    
    % Timer
    t = timer('Period', 1, 'TimerFcn', {@drawWaves, point, y0, f, p, c}, 'ExecutionMode', 'FixedRate');
    start(t);
    uiwait(gcf());
    stop(t);
    delete(t);
end

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