################################################################################
##  File:  Validate-InnoSetup.ps1
##  Team:  CI-X
##  Desc:  Validate Inno Setup
################################################################################

if (Get-Command -Name 'iscc')
{
    Write-Host "iscc on path"
}
else
{
    Write-Host 'iscc is not on path'
    exit 1
}

# Adding description of the software to Markdown
$SoftwareName = "Inno Setup"

$ChocoList = $(choco list --local-only innosetup) | Select-String -Pattern "InnoSetup"
$ChocoList -Match "\d+\.\d+\.\d+"
$Version = $Matches[0]

$Description = @"
_Version:_ $Version<br/>
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description