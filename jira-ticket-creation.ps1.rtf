{\rtf1\ansi\ansicpg1252\cocoartf2708
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red26\green26\blue26;\red255\green255\blue255;\red16\green60\blue192;
}
{\*\expandedcolortbl;;\cssrgb\c13333\c13333\c13333;\cssrgb\c100000\c100000\c100000;\cssrgb\c6667\c33333\c80000;
}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs20 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # setting script path\
$cd = Split-Path $script:MyInvocation.MyCommand.Path\
\
# importing configuration from .psd1 file\
$File = Import-LocalizedData -BaseDirectory $cd -FileName solutions.psd1\
\
# user defined variables - CHANGE BEFORE RUNNING SCRIPT!!!\
[string]$username = ""\
[string]$password = ""\
[string]$target = '{\field{\*\fldinst{HYPERLINK "https://jira-uat.14west.us/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 https://jira-uat.14west.us}}'\
#[string]$target = '{\field{\*\fldinst{HYPERLINK "https://jira.14west.us/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 https://jira.14west.us}}'\
[string]$projectkey = 'ITSYS'\
# CONFIGURE TO THE CURRENT MONTH - Ex. "Apr 2020", Ex. "Jul 2020"\
[string]$date = 'Jun 2020'\
#[string]$epic = 'ITSYS-1044'\
[string]$epic = 'INFOSEC-2133'\
\
# grabbing solution keys from .psd1 file\
$solutions = $File.Solutions.Keys\
\
# iterating through the solutions in the .psd1 file\
foreach ($i in $solutions)\
\{\
\'a0 \'a0 \'a0 \'a0 # assigning variables from solution\
\'a0 \'a0 \'a0 \'a0 [string]$name = $File.Solutions.$i.Name\
\'a0 \'a0 \'a0 \'a0 [string]$shortname = $File.Solutions.$i.ShortName\
\'a0 \'a0 \'a0 \'a0 [string]$reporter = $File.Solutions.$i.Reporter\
\'a0 \'a0 \'a0 \'a0 [string]$assignee = $File.Solutions.$i.Assignee\
\'a0 \'a0 \'a0 \'a0 # there could be mutiple watchers so we build a list of strings\
\'a0 \'a0 \'a0 \'a0 [object]$watchers = $($File.Solutions.$i.Watchers)\
\'a0 \'a0 \'a0 \'a0 [string]$pddata = $File.Solutions.$i.PdData\
\'a0 \'a0 \'a0 \'a0 [string]$npdata = $File.Solutions.$i.NpData\
\'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0fields = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0project = @\{ key = $projectKey \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0summary = "$name Patching - $date"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0description = "Placeholder for patching $name production and non-production systems."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0issuetype = @\{ name = "Story" \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0assignee = @\{ name = $assignee \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0reporter = @\{ name = $reporter\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0components = @(@\{ name = $date \})\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # ifnot corp solution i.e. doesnt have non-prod data\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 if ($npdata -ne '')\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # creating placeholder story\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Creating $shortname placeholder ticket..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $story = $($response.key)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # creating np tickets\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # NOTES:\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # \'a0 \'a0 \'a0 -\'a0{\field{\*\fldinst{HYPERLINK "https://jira.14west.us/rest/api/2/issuetype"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 https://jira.14west.us/rest/api/2/issuetype}}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # \'a0 \'a0 \'a0 -\'a0{\field{\*\fldinst{HYPERLINK "https://jira-uat.14west.us/rest/api/2/issue/createmeta"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 https://jira-uat.14west.us/rest/api/2/issue/createmeta}}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0fields = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0project = @\{ key = $projectKey \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0summary = "Patch $shortname Non-Prod Servers - $date"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0description = "We need to install the latest patches on the following servers for the month:\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0$npdata"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0issuetype = @\{ name = "Patching" \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0assignee = @\{ name = $assignee \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0reporter = @\{ name = $reporter\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0components = @(@\{ name = $date \})\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Creating $shortname Non-Prod ticket..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $task1 = $($response.key)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # adding non-prod to epic\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 issues = @("$task1")\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/agile/1.0/epic/$epic/issue"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Adding $task1 to epic..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)" \'a0 \'a0\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # adding watchers to non-prod\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 foreach ($w in $watchers)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body = """$w"""\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/$task1/watchers"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Adding watcher: $w to $task1"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Error adding watcher: $w to Non-Prod task - $task1"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # creating prod tickets\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0fields = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0project = @\{ key = $projectKey \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0summary = "Patch $shortname Prod Servers - $date"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0description = "We need to install the latest patches on the following servers for the month:\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0$pddata"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0issuetype = @\{ name = "Patching" \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0assignee = @\{ name = $assignee \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0reporter = @\{ name = $reporter\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0components = @(@\{ name = $date \})\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Creating $shortname Prod ticket..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $task2 = $($response.key)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # adding prod to epic\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 issues = @("$task2")\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/agile/1.0/epic/$epic/issue"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Adding $task2 to epic..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)" \'a0 \'a0\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # adding watchers to prod\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 foreach ($w in $watchers)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body = """$w"""\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/$task2/watchers"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Adding watcher: $w to $task2"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Error adding watcher: $w to $shortname Prod task - $task2"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # linking issues - Task1\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0[string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0type = @\{ name = "Relates" \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0inwardIssue = @\{ key = $story\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0outwardIssue = @\{ key = $task1\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issueLink"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Issue linking $task1 to $story"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # linking issues - Task2\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0[string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0type = @\{ name = "Relates" \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0inwardIssue = @\{ key = $story\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0outwardIssue = @\{ key = $task2\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issueLink"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Issue linking $task2 to $story"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 else # creates only production ticket\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # creating np tickets - CORP ONLY SYSTEMS\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0fields = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0project = @\{ key = $projectKey \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0summary = "Patch $shortname Non-Prod Servers - $date"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0description = "We need to install the latest patches on the following servers for the month:\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0$npdata"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0issuetype = @\{ name = "Patching" \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0assignee = @\{ name = $assignee \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0reporter = @\{ name = $reporter\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0components = @(@\{ name = $date \})\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0\} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Creating $shortname Non-Prod ticket..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $task1 = $($response.key)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # adding prod corp ticket to epic\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body =\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 issues = @("$task1")\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \} | ConvertTo-Json -Depth 10\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/agile/1.0/epic/$epic/issue"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Adding $task1 to epic..."\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "ID: $(${\field{\*\fldinst{HYPERLINK "http://response.id/"}}{\fldrslt \cf4 \ul \ulc4 \strokec4 response.id}})"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Key: $($response.key)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Self: $($response.self)" \'a0 \'a0\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 # adding watchers to np corp tickets\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 foreach ($w in $watchers)\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 [string]$body = """$w"""\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 try \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($username):$password"))\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $headers = @\{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Authorization" = $basicAuth\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 "Content-Type"="application/json"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $requestUri = "$target/rest/api/2/issue/$task2/watchers"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 $response = Invoke-RestMethod -Uri $requestUri -Method POST -Headers $headers -Body $body -UseBasicParsing\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Adding watcher: $w to $task2"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 catch \{\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 write-host "Error adding watcher: $w to $task1"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Warning "Remote Server Response: $($_.Exception.Message)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 Write-Output "Status Code: $($_.Exception.Response.StatusCode)"\
\'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \'a0 \'a0 \}\
\'a0 \'a0 \}\
\}}