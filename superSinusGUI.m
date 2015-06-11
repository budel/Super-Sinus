function superSinusGUI
% Function to show GUI which controls 2d sin waves
% Author: Daniel Budelmann and Sebastian Voges (c) IHA @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 18-May-2015 			 Initials DB and SV
% Ver. 0.02 changed imgHandle to hplot 23-May-2015 	 Initials DB and SV
% Ver. 0.03 parameters global 11-Jun-2015 Initials DB and SV

% create empty image and show it
figure;
contourf([], [], []);
axis([-4 4 -4 4]);

% Amplitude
global y0; y0 = 1;
% Frequency 
global f; f = 1/10;
T = 1/f;
% Phase
global p; p = 0;

% first, there is no wave function
global zSum;
zSum = cell(T,1);
zSum(:) = {0};

% attach mouseclick callback
set(gca(),'ButtonDownFcn',@onMouseClick);



%--------------------Licence ---------------------------------------------
% Copyright (c) <2015> Daniel Budelmann and Sebastian Voges
% Institute for Hearing Technology and Audiology
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