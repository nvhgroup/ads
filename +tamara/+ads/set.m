


function success = set(filepath, stream, val)

if nargin < 3
    error('tamara:ads:set:nargin', 'tamara.ads.set: too few input arguments.')
end
if isnumeric(val)
    val = num2str(val);
end
if ~ischar(val)
    error('tamara:ads:set:argin', 'tamara.ads.set: invalid value.')
end

if isstring(filepath)
    filepath = char(filepath);
end

if ~exist(filepath, 'file')
    success = tamara.powershell(['New-Item -Path "', filepath, '" | Set-Content -Stream "', stream, '" -value "', val, '"']);
else
    success = tamara.powershell(['Get-Item "', filepath,'" | Set-Content -Stream "', stream, '" -value "', val, '"']);
end

end

