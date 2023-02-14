


function [success, val] = get(filepath, stream)

if nargin < 2
    error('tamara:ads:get:nargin', 'tamara.ads.get: too few input arguments.')
end

if isstring(filepath)
    filepath = char(filepath);
end

if strcmpi(stream, '*')
    [success, D] = tamara.powershell(['Get-Item "', filepath, '" -Stream * | Where-Object {$_.Stream -notcontains '':$DATA''}']);
    if success
        C = cell(length(D), 2);
        for count = 1:size(C, 1)
            C{count, 2} = char(D{count}.Stream);
            [success, y] = tamara.powershell(['Get-Item "', filepath,'" | Get-Content -Stream "', C{count, 2}, '"']);
            if success
                C{count, 1} = strjoin(y, newline);
            else
                break
            end
        end
    else
        C = cell(0);
    end
else
    [success, C] = tamara.powershell(['Get-Item "', filepath,'" | Get-Content -Stream "', stream, '"']);
end

if ~isempty(C) && ~ismatrix(C) && ischar(C{1})
    val = strjoin(C, newline);
else
    val = C;
end

end

