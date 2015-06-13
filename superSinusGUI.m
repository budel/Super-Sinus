function superSinusGUI
% Function to show GUI which controls 2d sin waves
% Author: Daniel Budelmann and Sebastian Voges (c) IHA @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial create 18-May-2015 			 Initials DB and SV
% Ver. 0.02 changed imgHandle to hplot 23-May-2015 	 Initials DB and SV
% Ver. 0.03 parameters global 11-Jun-2015 Initials DB and SV
% Ver. 0.04 GUI with buttons 13-Jun-2015 Initials DB and SV
% Ver. 0.10 functional GUI with rainbow color 13-Jun-2015 Initials DB and SV

% initialize default values:
% Amplitude
global y0; y0 = 1;
% Frequency 
global f; f = 1/10;
% Phase
global p; p = 0;

% create GUI
hfig = figure('MenuBar','none', 'Toolbar','none', 'Position',[50 50 840 500], 'CloseRequestFcn', @closeCallback);
% create empty axes and show it
wavePlot = axes('Parent',hfig, 'Units', 'pixels', 'Position',[50 50 400 400]);
contourf([], [], []);
axis([-4 4 -4 4]);  % this regulates the number of waves the user will see
set(wavePlot, 'xtick',[], 'ytick',[]);

% draw GUI with Edit-Fields for Amplitude, Frequency and Phase and a submit
% button, which is connected to submitCallback
posL = 500; posD = 410;
w = 140; h = 40;
uicontrol('style','text', 'string','Amplitude:','BackgroundColor',[1 0 0],'FontSize',20, 'position', [posL posD w h]);
amplitude = uicontrol('style','edit', 'string',num2str(y0), 'BackgroundColor',[1 0.5 0],'FontSize',10, 'position', [posL+w posD w h]);
uicontrol('style','text', 'string','Frequency:','BackgroundColor',[1 1 0],'FontSize',20, 'position', [posL posD-h w h]);
frequency = uicontrol('style','edit', 'string',num2str(f), 'BackgroundColor',[0 1 0],'FontSize',10, 'position', [posL+w posD-h w h]);
uicontrol('style','text', 'string','Phase:','BackgroundColor',[0 0.5 0],'FontSize',20, 'position', [posL posD-2*h w h]);
phase = uicontrol('style','edit', 'string',num2str(p), 'BackgroundColor',[0 0 1],'FontSize',10, 'position', [posL+w posD-2*h w h]);
uicontrol('style', 'pushbutton', 'string', 'submit',...
    'Callback',{@submitCallback,frequency,amplitude,phase},'BackgroundColor',[0.7 0 1],'FontSize',20, 'position', [posL+w/2 posD-4*h w h]);

% attach mouseclick callback
set(gca(),'ButtonDownFcn',@onMouseClick);

end

% if the GUI is closed
function closeCallback(h,e)
    % stop old timers if exist
    if ~isempty(timerfind)
        stop(timerfind);
        delete(timerfind);
    end
    % clear all global variables
    clear global y0 f p zSum i;
    % delete figure
    delete(h);
end

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