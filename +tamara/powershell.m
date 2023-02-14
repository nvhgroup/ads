


function [success, y] = powershell(str)

persistent PS

if ~ispc
    success = false;
    y = cell(0);
    return
end

if isempty(PS)
    try
        PS = System.Management.Automation.PowerShell.Create();
    catch
        NET.addAssembly('System.Management.Automation');
        PS = System.Management.Automation.PowerShell.Create();
    end
end

if nargin < 1
    PS.Dispose
    PS = [];
    return
end

try
    PS.AddScript(str);
    RES = PS.Invoke();
    success = ~PS.HadErrors;
catch
    success = false;
end

if ~success
    PS.Dispose()
    PS = [];
end

y = cell(RES.Count, 1);
for count = 1:size(y, 1)
    if isa(RES.Item(count-1).BaseObject, 'System.String')
        tempstr = strtrim(char(RES.Item(count-1).BaseObject));
        if startsWith(tempstr, '"') && endsWith(tempstr, '"')
            tempstr = tempstr(2:end-1);
        end
        y{count} = tempstr;
    else
        y{count} = RES.Item(count-1).BaseObject;
    end
end


end


