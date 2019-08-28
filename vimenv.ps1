Param($Method)

$configData = Get-Content .\config.json | ConvertFrom-Json
$nowPath = Get-Location

Set-Location $configData.bundlePath

if ($Method -eq "update") {
    $installedPackages = Get-ChildItem * | Where-Object { $_.PSIsContainer }
    foreach($package in $installedPackages.Name) {
        Set-Location $package
        git pull
        Set-Location "..\"
    }
}

if ($Method -eq "install" -or $null -eq $Method) {
    foreach ($package in $configData.packages) {
        $packageName = $package.Split("/")[-1]
        if (!(Test-Path -Path $packageName)) {
            git clone $package
        }
    }
}

Set-Location $nowPath.Path