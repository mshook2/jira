# setting script path
$cd = Split-Path $script:MyInvocation.MyCommand.Path

# importing configuration from .psd1 file
$File = Import-LocalizedData -BaseDirectory $cd -FileName solutions.psd1

# user defined variables - CHANGE BEFORE RUNNING SCRIPT!!!
[string]$username = ""
[string]$password = ""
# jira url (ex. https://jira3.cerner.com
[string]$target = ''
# set project key (ex. 'ITSYS'
[string]$projectkey = ''
# CONFIGURE TO THE CURRENT MONTH - Ex. "Apr 2020", Ex. "Jul 2020"
[string]$date = 'Jun 2020'
# epic name (ex. 'INFOSEC-2133'
[string]$epic = ''

# grabbing solution keys from .psd1 file
$solutions = $File.Solutions.Keys

# iterating through the solutions in the .psd1 file
foreach ($i in $solutions)
{
        # assigning variables from solution
        [string]$name = $File.Solutions.$i.Name
        [string]$shortname = $File.Solutions.$i.ShortName
        [string]$reporter = $File.Solutions.$i.Reporter
        [string]$assignee = $File.Solutions.$i.Assignee
        # there could be mutiple watchers so we build a list of strings
        [object]$watchers = $($File.Solutions.$i.Watchers)
        [string]$pddata = $File.Solutions.$i.PdData
        [string]$npdata = $File.Solutions.$i.NpData
        [string]$body = 
            @{
             fields = @{
             project = @{ key = $projectKey }
             summary = "$name Patching - $date"
             description = "Placeholder for patching $name production and non-production systems."
             issuetype = @{ name = "Story" }
             assignee = @{ name = $assignee }
             reporter = @{ name = $reporter}
             components = @(@{ name = $date })
             }
             } | ConvertTo-Json -Depth 10
            # ifnot corp solution i.e. doesnt have non-prod data
            if ($npdata -ne '')
            {
            # creating placeholder story
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Creating $shortname placeholder ticket..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"
                $story = $($response.key)
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # creating np tickets
            # NOTES:
            #       - https://jira.<domain>/rest/api/2/issuetype
            #       - https://jira-uat.<domain>/rest/api/2/issue/createmeta
            [string]$body = 
            @{
             fields = @{
             project = @{ key = $projectKey }
             summary = "Patch $shortname Non-Prod Servers - $date"
             description = "We need to install the latest patches on the following servers for the month:
             $npdata"
             issuetype = @{ name = "Patching" }
             assignee = @{ name = $assignee }
             reporter = @{ name = $reporter}
             components = @(@{ name = $date })
             }
             } | ConvertTo-Json -Depth 10
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Creating $shortname Non-Prod ticket..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"
                $task1 = $($response.key)
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # adding non-prod to epic
            [string]$body =
            @{
            issues = @("$task1")
            } | ConvertTo-Json -Depth 10
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/agile/1.0/epic/$epic/issue"
                $requestUri
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Adding $task1 to epic..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"    
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # adding watchers to non-prod
            foreach ($w in $watchers)
            {
            [string]$body = """$w"""
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/$task1/watchers"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Adding watcher: $w to $task1"
            }
            catch {
                write-host "Error adding watcher: $w to Non-Prod task - $task1"
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            }
            # creating prod tickets
            [string]$body = 
            @{
             fields = @{
             project = @{ key = $projectKey }
             summary = "Patch $shortname Prod Servers - $date"
             description = "We need to install the latest patches on the following servers for the month:
             $pddata"
             issuetype = @{ name = "Patching" }
             assignee = @{ name = $assignee }
             reporter = @{ name = $reporter}
             components = @(@{ name = $date })
             }
             } | ConvertTo-Json -Depth 10
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Creating $shortname Prod ticket..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"
                $task2 = $($response.key)
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # adding prod to epic
            [string]$body =
            @{
            issues = @("$task2")
            } | ConvertTo-Json -Depth 10
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/agile/1.0/epic/$epic/issue"
                $requestUri
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Adding $task2 to epic..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"    
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # adding watchers to prod
            foreach ($w in $watchers)
            {
            [string]$body = """$w"""
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/$task2/watchers"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Adding watcher: $w to $task2"
            }
            catch {
                write-host "Error adding watcher: $w to $shortname Prod task - $task2"
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            }
            # linking issues - Task1
             [string]$body = 
            @{
             type = @{ name = "Relates" }
             inwardIssue = @{ key = $story}
             outwardIssue = @{ key = $task1}
             } | ConvertTo-Json -Depth 10
             try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issueLink"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
            }
            catch {
                write-host "Issue linking $task1 to $story"
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # linking issues - Task2
             [string]$body = 
            @{
             type = @{ name = "Relates" }
             inwardIssue = @{ key = $story}
             outwardIssue = @{ key = $task2}
             } | ConvertTo-Json -Depth 10
             try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issueLink"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
            }
            catch {
                write-host "Issue linking $task2 to $story"
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            }
            else # creates only production ticket
            {
            # creating np tickets - CORP ONLY SYSTEMS
            [string]$body = 
            @{
             fields = @{
             project = @{ key = $projectKey }
             summary = "Patch $shortname Non-Prod Servers - $date"
             description = "We need to install the latest patches on the following servers for the month:
             $npdata"
             issuetype = @{ name = "Patching" }
             assignee = @{ name = $assignee }
             reporter = @{ name = $reporter}
             components = @(@{ name = $date })
             }
             } | ConvertTo-Json -Depth 10
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Creating $shortname Non-Prod ticket..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"
                $task1 = $($response.key)
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # adding prod corp ticket to epic
            [string]$body =
            @{
            issues = @("$task1")
            } | ConvertTo-Json -Depth 10
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/agile/1.0/epic/$epic/issue"
                $requestUri
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Adding $task1 to epic..."
                Write-Output "ID: $($response.id)"
                Write-Output "Key: $($response.key)"
                Write-Output "Self: $($response.self)"    
            }
            catch {
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
            # adding watchers to np corp tickets
            foreach ($w in $watchers)
            {
            [string]$body = """$w"""
            try {
                $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))
                $headers = @{
                    "Authorization" = $basicAuth
                    "Content-Type"="application/json"
                }
                $requestUri = "$target/rest/api/2/issue/$task2/watchers"
                $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing
                write-host "Adding watcher: $w to $task2"
            }
            catch {
                write-host "Error adding watcher: $w to $task1"
                Write-Warning "Remote Server Response: $($_.Exception.Message)"
                Write-Output "Status Code: $($_.Exception.Response.StatusCode)"
            }
        }
    }
}
