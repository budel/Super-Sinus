function newFunction(szFileName,szAuthor, bGenTestScript)
% function to create two new m files with all relevant documentation (to be filled)
% Usage: newFunctionAndTester(szFileName,szAuthor)
% Input parameter:
%       szFileName:     Name of new m-files without extension and Test (.m)
%       szAuthor:       Name of Author
%       bGenTestScript: switch to generate a tester file automatically
%                       (default = 1, therefore a test script is generated)
% Output parameter:
%       None
% Output:
%    one or two new m files (Function and Tester (if desired)) with comments but no functionality
% ------------------------------------------------------------------------
% Example: newFunction('computeSNR','J. Bitzer');

% Author: J. Bitzer (c) TGM @ Jade Hochschule applied licence see EOF
% Co-Author: Stephanus Volke (c) Jade Hochschule applied licence see EOF
% Version History:
% Ver. 0.01 initial create (empty) 14-Apr-2011 JB
% Ver. 1.0  implemented and tested 14-Apr-2011 JB
% Ver. 1.1  Added automatic opening of editor and example in comment block
%                                  12.Jul-2011 JB
% Ver. 2.0  Merging Function and Tester generation into one File
%                                  14-May-2013 SV
% Ver. 2.1  Renaming and switch for tester function included, add fuction
% call in test script
%                                  01-Oct-2013 JB
if nargin < 3
    bGenTestScript = 1;
end
szFunctionReturn = which(szFileName);
if bGenTestScript
    szTestReturn = which([szFileName,'Test']);
end

if ~isempty(szFunctionReturn)
    error(sprintf('function exists in matlab path, see %s',szTestReturn));
    %error('function or script with the same name exists in matlab path\n, see %s',szFunctionReturn);
end
if bGenTestScript
    if ~isempty(szTestReturn)
        %    error(sprintf('function exists in matlab path, see %s',szTestReturn));
        error('test script with the same name exists in matlab path\n, see %s',szFunctionReturn);
    end
end
fid = fopen(sprintf('%s.m',szFileName),'w');
fprintf(fid, 'function [out_param] = %s(in_param)\n',szFileName);
fprintf(fid, '%% function to do something usefull (fill out)\n');
fprintf(fid, '%% Usage [out_param] = %s(in_param)\n',szFileName');
fprintf(fid, '%% Input Parameter:\n');
fprintf(fid, '%%\t in_param: \t\t Explain the parameter, default values, and units\n');
fprintf(fid, '%% Output Parameter:\n');
fprintf(fid, '%%\t out_param: \t Explain the parameter, default values, and units\n');
fprintf(fid, '%%------------------------------------------------------------------------ \n');
fprintf(fid, '%% Example: Provide example here if applicable (one or two lines) \n');
fprintf(fid, '\n');
fprintf(fid, '%% Author: %s (c) TGM @ Jade Hochschule applied licence see EOF \n',szAuthor);
fprintf(fid, '%% Version History:\n');
fprintf(fid, '%% Ver. 0.01 initial create (empty) %s  Initials (eg. JB)\n',date);
fprintf(fid, '\n');
fprintf(fid, '%%------------Your function implementation here--------------------------- \n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '\n');
fprintf(fid, '%%--------------------Licence ---------------------------------------------\n');
szYear = date;
szYear(1:end-4) = [];
fprintf(fid, '%% Copyright (c) <%s> %s\n',szYear,szAuthor);
fprintf(fid, '%% Jade University of Applied Sciences \n');
fprintf(fid, '%% Permission is hereby granted, free of charge, to any person obtaining \n%% a copy of this software and associated documentation files \n%% (the "Software"), to deal in the Software without restriction, including \n%% without limitation the rights to use, copy, modify, merge, publish, \n%% distribute, sublicense, and/or sell copies of the Software, and to\n%% permit persons to whom the Software is furnished to do so, subject\n%% to the following conditions:\n');
fprintf(fid, '%% The above copyright notice and this permission notice shall be included \n%% in all copies or substantial portions of the Software.\n');
fprintf(fid, '%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, \n%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \n%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. \n%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY \n%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, \n%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE \n%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.');

fclose (fid);
if bGenTestScript
    fid = fopen(sprintf('%s.m',[szFileName,'Test']),'w');
    fprintf(fid, '%% Script to test the function %s.m \n',szFileName);
    fprintf(fid, '%% Author: %s (c) TGM @ Jade Hochschule applied licence see EOF \n',szAuthor);
    fprintf(fid, '%% Version History:\n');
    fprintf(fid, '%% Ver. 0.01 initial create (empty) %s \t\t\t Initials (eg. JB)\n',date);
    fprintf(fid, '\n');
    
    fprintf(fid, 'clear;\nclose all;\nclc;\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%------------Your script starts here-------- \n');
    fprintf(fid, '\n');
    fprintf(fid, '%%Define your parameters and adjust your function call\n');
    fprintf(fid, '[out_param] = %s(in_param);\n',szFileName);
    fprintf(fid, '\n');
    fprintf(fid, '\n');
    fprintf(fid, '%%--------------------Licence ---------------------------------------------\n');
    szYear = date;
    szYear(1:end-4) = [];
    fprintf(fid, '%% Copyright (c) <%s> %s\n',szYear,szAuthor);
    fprintf(fid, '%% Jade University of Applied Sciences \n');
    fprintf(fid, '%% Permission is hereby granted, free of charge, to any person obtaining \n%% a copy of this software and associated documentation files \n%% (the "Software"), to deal in the Software without restriction, including \n%% without limitation the rights to use, copy, modify, merge, publish, \n%% distribute, sublicense, and/or sell copies of the Software, and to\n%% permit persons to whom the Software is furnished to do so, subject\n%% to the following conditions:\n');
    fprintf(fid, '%% The above copyright notice and this permission notice shall be included \n%% in all copies or substantial portions of the Software.\n');
    fprintf(fid, '%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, \n%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES \n%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. \n%% IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY \n%% CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, \n%% TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE \n%% SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.');
    
    fclose (fid);
    edit([szFileName,'Test']);
end
edit(szFileName);


%--------------------Licence ---------------------------------------------
% Copyright (c) <2011-2013> J. Bitzer, S. Volke
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
