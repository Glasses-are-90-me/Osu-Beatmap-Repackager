$folders = get-childitem
foreach ($folder in $folders)
{
    Write-Host($folder) 
    If ((Get-Item $folder) -is [System.IO.DirectoryInfo]) {
        Compress-Archive -Path $folder\* -DestinationPath $folder
    }
}
Get-ChildItem *.zip | Rename-Item -NewName { $_.name -Replace '\.zip','.osz' }