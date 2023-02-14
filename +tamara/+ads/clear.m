


function success = clear(filepath)

if isstring(filepath)
    filepath = char(filepath);
end

success = tamara.powershell(['Get-Item "', filepath, '" -Stream * | Where-Object {$_.Stream -notcontains '':$DATA''} | Remove-Item']);

end

