function coordinates = onMouseClick(handle, e)
% callback function to get Position of mouse Click
% Used in superSinusGUI
% Input Parameter:
%	 handle: 		 current handle
%    event:          current event
%------------------------------------------------------------------------ 

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 18-May-2015  Initials DB and SV
% Ver. 0.02 added circular plot 19-May-2015  Initials DB and SV

axesHandle  = get(handle,'Parent');
coordinates = get(axesHandle,'CurrentPoint'); 
x = coordinates(1,1)
y = coordinates(1,2)

% Amplitude
y0 = 1;
% Frequency
f = 1/(2*pi);
% Phase
p = 0;
% Time
t = 0;

% fill x and y
[x,y] = meshgrid(-2*pi:0.1:2*pi);
% circular wave function
r = sqrt(x.^2+y.^2);
z = y0*sin(2*pi*(r-f*t+p));
% plot
contourf(x,y,z);
% remove ticks and color plot
set(gca,'XTick',[],'YTick',[]);
colormap winter;

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