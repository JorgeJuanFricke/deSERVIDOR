
##############################################################################
##
## Actualiza ley
##
## From Windows PowerShell Cookbook (O'Reilly)
## by Lee Holmes (http://www.leeholmes.com/guide)
##
##############################################################################
<#
.SYNOPSIS
lee datos de las leyes desde el BOE
.EXAMPLE
PS > Search-Bing PowerShell
Searches Bing for the term "PowerShell"
#>
param(
## The term to search for
Set-StrictMode -Version 3
##
## Get-Content tmp.log | Out-File -Encoding UTF8 new.log
##
## Create the URL that contains the Twitter search results
Add-Type -Assembly System.Web
$queryUrl = 'http://www.bing.com/search?q={0}'
$queryUrl = $queryUrl -f ([System.Web.HttpUtility]::UrlEncode($pattern))

## Download the web page
$results = [string] (Invoke-WebRequest $queryUrl)

## Extract the text of the results, which are contained in
## segments that look like "<div class="sb_tlst">...</div>"

$ma
$Pattern = "PowerShell

Solution
Use the Invoke-WebRequest cmdlet to download a web page, and then access the Con
tent property (or cast the result to a [string]):
PS > $source = "http://www.bing.com/search?q=sqrt(2)"
PS > $result = [string] (Invoke-WebRequest $source)
