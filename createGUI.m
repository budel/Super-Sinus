function [frequency,amplitude,phase] = createGUI()
% function to create a GUI in relation to superSinusGUI.m, in which the
% user can change frequency, amplitude and phase (Output Parameter)
%
% Usage [frequency,amplitude,phase] = createGUI()
% Input Parameter:
%    non-existent
% Output Parameter:
%	 frequency:     frequency, the user chooses
%    amplitude:     amplitude, the user chooses
%    phase:         phase, the user chooses
%------------------------------------------------------------------------ 

% Author: Daniel Budelmann and Sebastian Voges (c) TGM @ Jade Hochschule applied licence see EOF 
% Version History:
% Ver. 0.01 initial creation 12-Jun-2015  Initials DB and SV
% Ver. 0.02 GUI completed    13-Jun-2015 Initials DB and SV

%----------------------Start function------------------------------------ 
%
figure();
set(gcf,'Color',[1,1,1]);
uicontrol('style','text', 'string','TOPIC','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 0],'FontSize',20,'FontWeight','bold', 'position',[.5 .5 .5 .5],'Units', 'normalized');
uicontrol('style','text', 'string','Frequency:','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 0],'FontSize',20, 'position', [50 200 140 40],'Units', 'normalized');
uicontrol('style','text', 'string','Amplitude:','ForegroundColor',[0 0 0],'BackgroundColor',[1 0 1],'FontSize',20, 'position', [50 160 140 40],'Units', 'normalized');
uicontrol('style','text', 'string','Phase:','ForegroundColor',[0 0 0],'BackgroundColor',[0 1 1],'FontSize',20, 'position', [50 120 140 40],'Units', 'normalized');
frequency = uicontrol('style', 'edit','ForegroundColor',[0 0 0],'BackgroundColor',[1 1 0.5],'FontSize',10, 'string', '', 'position', [190 200 140 40],'Units', 'normalized');
amplitude = uicontrol('style', 'edit','ForegroundColor',[0 0 0],'BackgroundColor',[1 0.7 0],'FontSize',10, 'string', '', 'position', [190 160 140 40],'Units', 'normalized');
phase = uicontrol('style', 'edit','ForegroundColor',[0 0 0],'BackgroundColor',[0.8 1 1],'FontSize',10, 'string', '', 'position', [190 120 140 40],'Units', 'normalized');
uicontrol('style', 'pushbutton', 'string', 'submit','Callback',{@callbackGUI,frequency,amplitude,phase},'ForegroundColor',[0 0 0],'BackgroundColor',[0 1 1],'FontSize',20, 'position', [80 60 140 40],'Units', 'normalized');



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