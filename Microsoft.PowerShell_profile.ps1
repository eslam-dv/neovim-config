function Get-GitStatus {
    $status = git status --porcelain 2>$null
    if (-not [string]::IsNullOrWhiteSpace($status)) {
        return " on  $(git branch --show-current)"
    }
    return ""
}

function prompt {
    $currentDirectory = $pwd.ProviderPath
    $homeDirectory = [System.Environment]::GetFolderPath("UserProfile")

    if ($currentDirectory.StartsWith($homeDirectory)) {
        $currentDirectory = $currentDirectory.Replace($homeDirectory, "~")
    }
    
    $gitStatus = Get-GitStatus

    Write-Host -NoNewline -ForegroundColor Blue "$currentDirectory"
    Write-Host -ForegroundColor Magenta $gitStatus
    Write-Host -NoNewline "❯" -ForegroundColor Green
    return " "
}
